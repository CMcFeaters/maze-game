package Board 
{

	import flash.display.Sprite;
	/**
	 * ...
	 * @author cmcfeaters
	 * sides are the boundaries of squares.
	 * they are either walls or doors
	 */
	public class Side extends Sprite
	{
		public var canPass:Boolean;//determines if this side can be passed through
		private var type:String;//determines the type of side ex: 'door','wall'
		private var col:int;//color of the line
		private var line:Sprite;//this is the line
		
		public function Side(x1:int,y1:int,x2:int,y2:int,pass:Boolean,typ:String) 
		{
			canPass = pass;
			type = typ;
			line = new Sprite();
			drawLine(x1, y1, x2, y2);
			addChild(line);
		}
		
		public function drawLine(x1:int,y1:int,x2:int,y2:int):void {
			//draws the line 
			if (canPass) {
				trace("Pass");
				col = 0x4DBD33;
			}else { 
				trace("No PASS");
				col = 0xFF0000; 
				}
			line.graphics.lineStyle(3, col);
			line.graphics.moveTo(x1, y1);
			line.graphics.lineTo(x2, y2);
		}
		
		
		
	}

}