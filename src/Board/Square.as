package Board 
{
	import flash.display.Sprite;
	import Board.Side;
	
	/**
	 * ...
	 * @author cmcfeaters
	 */
	public class Square extends Sprite
	{
		public var rectangle:Sprite;
		private var mX:int, mY:int, recWidth:int;
		public var n:Side,e:Side,s:Side	,w:Side;

		public function Square(xS:int,yS:int) //the square information should be sent in from the board
		{
			mX = xS;
			mY = yS;
			recWidth = 40;
			rectangle = new Sprite();
			rectangle.graphics.beginFill(0xB0B0B0,1);//fill color
			rectangle.graphics.lineStyle(0, 0xFFFFFF);//border line stmYle
			rectangle.graphics.drawRect(mX, mY, recWidth, recWidth);//draw the rectangle
			rectangle.graphics.endFill();//stop filling?
			addChild(rectangle);
			makeSides(false,false,true,false);
			//z = new Side(40, 40, 80, 80, true, 'wall');

			//addChild(z);
			trace("I'M A SQUARE");
		}
		
		public function makeSides(nP:Boolean,eP:Boolean,sP:Boolean,wP:Boolean):void 
		{//creates the sides of the object
			n = new Side(mX, mY, mX + recWidth, mY , nP, 'wall');
			e = new Side(mX+recWidth, mY, mX + recWidth, mY + recWidth, eP, 'wall');
			s = new Side(mX, mY+recWidth, mX + recWidth, mY + recWidth, sP, 'wall');
			w = new Side(mX, mY, mX, mY + recWidth, wP, 'wall');
			addChild(n);
			addChild(e);
			addChild(s);
			addChild(w);
		}
		
	}

}