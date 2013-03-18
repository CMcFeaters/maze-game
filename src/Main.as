package 
{
	import Board.Board;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import files.fileReader;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import Tiles.Tile;
	/**
	 * ...
	 * @author cmcfeaters
	 */
	public class Main extends Sprite 
	{
		public var brd:Board, squareSize:int, lineThickness:int, bArray:Array;
		private var file:fileReader;
		public function Main():void 
		{
			squareSize = 20;
			file = new fileReader();
			file.fileR.addEventListener(Event.COMPLETE, completeHandler);//this executes when the file is completed loading
			
		}
		
		
		private function completeHandler(e:Event):void {
			//split into set of nested arrays
			bArray=[]
			for (var row:int = 0; row < file.results.length;row++ ) {
				bArray[row] = [];
				trace(file.results[row]);
				for (var col:int = 0; col < file.results[row].length; col++) {
					bArray[row][col] = file.results[row].slice(col, col + 1);
				}
			}
			makeBoard();
			
			
		}
		
		private function mouse_click(e:MouseEvent):void {
			trace('click');
		}
		
		private function makeBoard():void {
			//calls all fucntions to make the board;
			brd = new Board(bArray, squareSize);
			stage.addChild(brd);
			stage.addEventListener(MouseEvent.CLICK, mouse_click);
		}
	
	}
}
	
	