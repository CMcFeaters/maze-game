package 
{
	import Board.Board;
	import Board.Side;
	import Board.Square;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author cmcfeaters
	 */
	public class Main extends Sprite 
	{
		public var brd:Board;
		public function Main():void 
		{
			brd = new Board(2, 2);
			addChild(brd);
			
		}
	}
	
}