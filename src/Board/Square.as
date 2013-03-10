package Board 
{
	import flash.display.Sprite;
	
	/**
	 * produces a square sprite
	 * @author cmcfeaters
	 */
	public class Square extends Sprite
	{
		public var rectangle:Sprite,passable:Boolean,type:String;
		private var mX:int, mY:int;
		public var squareSize:int;//passed down from board
		

		public function Square(xS:int,yS:int,sz:int,sType:String) //the square information should be sent in from the board
		{
			//takes in asquare size, starting points and wall type.
			//wall type will be sent in from the board and the appropriate square will be returned
			mX = xS;//start point
			mY = yS;//start point
			squareSize = sz;//size
			type = sType;			//the wall type, maybe delete this
			rectangle = new Sprite();
			typeEval(sType);	//setup display properties
		}
		
		
		private function typeEval(type:String):void {
			//evaluates the ytype sent in and calls the appropriate display function
			if (type == "O") {//open space
				openSpace();
			}else if (type.split(",")[0] == "W") {//wall
				openSpace();
				wallDraw(int(type.split(",")[1]));
			}
		}
		 
		public function openSpace():void {
			//creates an open space rectangle and adds to square
			
			passable = true;
			rectangle.graphics.beginFill(0xB0B0B0,1);//fill color
			rectangle.graphics.lineStyle(0, 0x000000);//border line stmYle
			rectangle.graphics.drawRect(mX, mY, squareSize, squareSize);//draw the rectangle
			rectangle.graphics.endFill();//stop filling?
			//trace("("+mX+","+mY+") - "+squareSize);
			addChild(rectangle);
		}
		
		public function wallDraw(wallInt:int):void {
			//draws the walls based on wall int
								/*Wall types
			 * 							(URDL)
			 * + - 4 way intersection	(1111) 15
			 * -| T intersect right		(1011) 11
			 * |- T intersect left		(1110) 14
			 * T - t intersect up		(0111) 7
			 * t - t intersect down		(1101) 13
			 * |_ - corner 1			(1100) 12
			 * _| - corner 4			(1001) 9
			 * r - corner 2				(0110) 6
			 * 7 - corner 3				(0011) 3
			 * | - vert wall			(1010) 10
			 * 							(1000) 8
			 * 							(0010) 2 
			 * -  -horiz wall			(0101) 5
			 * 							(0100) 4
			 * 							(0001) 1
			 * o - all 4 sides			(0000) 0
			 */
			var col:int = 0xFF0000;	//color of our walls
			passable = false;//can't walk through walls
			
			//setup line stuff
			var line:Sprite = new Sprite();
			line.graphics.lineStyle(4, col);
			//trace(wallInt.valueOf());
			//these functions draw the lines in half section
			if([15,11,14,13,12,9,10,8].indexOf(wallInt)>-1){
				//vertical top half
					line.graphics.moveTo(mX + squareSize / 2, mY);
					line.graphics.lineTo(mX + squareSize / 2, mY + squareSize / 2);
			}
			if([15,11,14,7,6,3,10,2].indexOf(wallInt)>-1){//vertical bottom half 
					line.graphics.moveTo(mX + squareSize / 2, mY+squareSize);
					line.graphics.lineTo(mX + squareSize / 2, mY + squareSize / 2);
			}

			if([15,13,11,9,7,5,3,1].indexOf(wallInt)>-1){//horiz left half
					line.graphics.moveTo(mX + squareSize / 2, mY + squareSize / 2);
					line.graphics.lineTo(mX, mY + squareSize / 2);
			}

			if([15,14,7,13,12,6,5,4].indexOf(wallInt)>-1){//horiz right half
					line.graphics.moveTo(mX + squareSize / 2, mY + squareSize / 2);
					line.graphics.lineTo(mX+squareSize, mY + squareSize / 2);
			}

			if (wallInt == 0) {//4 sides
					line.graphics.beginFill(0xFF0000,1);//fill color
					line.graphics.drawRect(mX + squareSize / 4, mY + squareSize / 4, squareSize / 2, squareSize / 2);
					line.graphics.endFill();
			}
			addChild(line);
		}
	
		
	}

}