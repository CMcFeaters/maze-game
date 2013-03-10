package files 
{
	import flash.events.Event;
	import flash.net.FileFilter;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLLoaderDataFormat;
	import flash.net.FileReference;
	import flash.events.ProgressEvent;
	/**
	 * reads a file an array of strings
	 * @author cmcfeaters
	 */

	
	
	public class fileReader
	{
		public var results:Array, ready:Boolean;
		public var fileR:FileReference;
		public function fileReader()
		{
			ready = false;
			fileR = new FileReference();	//our file
			var fFilter:FileFilter = new FileFilter("Maps", "*.txt");	//the filter
			
			fileR.addEventListener(Event.CANCEL, cancelHandler);
			fileR.addEventListener(Event.SELECT, selectHandler);
			fileR.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			fileR.addEventListener(Event.COMPLETE, completeHandler);
			
			fileR.browse();
		}
		
		private function selectHandler(e:Event):void {
			trace('Selected file: ' + fileR.name);
			fileR.load();
		}
		
		private function cancelHandler(e:Event):void {
			trace("Cancelled, no file opened");
		}
		
		private function progressHandler(e:ProgressEvent):void {
			trace("Progress: " + e.bytesLoaded + " / " + e.bytesTotal);
		}
		
		private function completeHandler(e:Event):void {
			//read and prep file
			var tString:String = fileR.data.toString();
			
			results = tString.split(/\n/);
			ready = true;			
		}
		
	}

}