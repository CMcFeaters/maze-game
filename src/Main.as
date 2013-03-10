package 
{
	import Board.Board;
	import Board.Square;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import files.fileReader;
	import flash.events.ProgressEvent;
	/**
	 * ...
	 * @author cmcfeaters
	 */
	public class Main extends Sprite 
	{
		public var brd:Board, squareSize:int, lineThickness:int,bArray:Array;
		private var file:fileReader;
		public function Main():void 
		{
			/*squareSize = 10;
			brd = new Board(10,10,squareSize);
			this.addChild(brd);
			brd.createBoard();
			brd.addSquares();*/
			squareSize = 20;
			file = new fileReader();
			file.fileR.addEventListener(Event.COMPLETE, completeHandler);//this executes when the file is completed loading
			//addEventListener(file.ready==true, fileComplete);
			
;
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
		
		private function makeBoard():void {
			//calls all fucntions to make the board;
			brd = new Board(bArray, squareSize);
			stage.addChild(brd);
		}
	}
}
	
	