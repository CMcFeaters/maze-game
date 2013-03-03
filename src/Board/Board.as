package Board 
{
	import flash.display.Sprite;
	import Math;
	/**
	 * ...
	 * @author cmcfeaters
	 */
	public class Board extends Sprite
	{
		public var bWidth:int, bDepth:int, startX:int, startY:int;
		public var bArray:Array;
		public function Board(bW:int,bD:int) 
		{
			bWidth = bW;//number of squares wide must be <= 800/50
			bDepth = bD;//nubmer of squares deep must be <= 600/50
			startX = Math.round((800 - bWidth * 50) / 2); //starting x position
			startY = Math.round((600 - bDepth * 50) / 2);//starting y position
			trace("StartX: " + startX + " StartY: " + startY);
			bArray = new Array(bWidth,bDepth);
			addSquares();
			trace(bArray);
			//addSquares();
			
			
			
		}
		
		public function addSquares():void {
			//adds the squares to the board
			//later this will need to determine the path through the maze with true/false
			for (var r:int = 0; r < bWidth; r++) {//row
				for (var c:int = 0; c < bDepth; c++) {//col
					//bArray[r][c] = new Square(startX + 50 * r, startY + 50 * c);
					//addChild(bArray[r,c]);
					bArray[r][c] ='fuck'
				}
			}
		}
	}

}