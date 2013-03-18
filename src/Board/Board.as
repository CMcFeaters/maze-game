package Board 
{
	import flash.display.Sprite;
	import Math;
	import Tiles.Blank;
	import Tiles.OpenSpace;
	import Tiles.Wall;
	/**
	 * this is a board factory, it is given a matrix of the board in text format
	 * and produces a board from that
	 * it uses the sqaure class to create its individual pieces
	 * 
	 * boards needs to take in and send out the tArray 
	 * bArray will reflect tArray, each item in tArray will be converted to it's square equivalent
	 * 
	 * 
	 * @author cmcfeaters
	 */
	public class Board extends Sprite
	{
		public var bWidth:int, bDepth:int, startX:int, startY:int;
		public var bArray:Array, tempArray:Array;
		private var squareSize:int;
		
		public function Board(tArray:Array, size:int)
		{
			//creates a board
			//tArray  - the text array of the maze, contains each square type
			//size - the size of each square
			tempArray = tArray;
			squareSize = size;
			bWidth = tArray[0].length-1;//number of squares wide must be <= 800/50
			
			bDepth = tArray.length;//nubmer of squares deep must be <= 600/50

			startX = Math.round((800 - bWidth * squareSize) / 2); //starting x position
			startY = Math.round((600 - bDepth * squareSize) / 2);//starting y position.
			
			createBoard();//make the blank board
			addTiles();//add the squares
		}
		
		public function createBoard():void {
			//function that creates an empty board of nested arrays

			bArray = new Array(bDepth);//board array is bDepth arrays deep
			for (var r:int = 0; r < bDepth; r++) {
				bArray[r] = [];
			}
		}
		/*******************************
		 * may need to add a switch array to keep track of switch status
		 * *******************************/
		public function addTiles():void {
			//transforms tArray into a bArray of tiles
			var sType:String;//a string representing the type of square being created
			var temp;// a place holder for the tile to be added to the board array
			var sX:int, sY:int;
			
			for (var r:int = 0; r < bDepth; r++) {//row
				for (var c:int = 0; c < tempArray[r].length ; c++) {//col
					
					sX = startX + squareSize * c;	//x starting coordinate
					sY = startY + squareSize * r;	//y starting coordinate
					
					sType = tempArray[r][c];	//read the tile type from the text file
					
					switch (sType) {//determine what type of tile will be added to the board
						case "W"://the tile is a wall
							temp = new Wall(r*bDepth+c+1,sX, sY, squareSize, wallAnalyzer(r, c));
							
							break;
						case "O"://the tile is an open space
							temp = new OpenSpace(r*bDepth+c+1,sX, sY, squareSize);
							break;
						default://the tile is a blankspace/unknwon
							temp = new Blank(r*bDepth+c+1,sX, sY, squareSize);
							break;
					}
					
						
					bArray[r][c] = temp;//create the square
					addChild(bArray[r][c]);
					
				}
			}
		}
		
		public function wallAnalyzer(r:int,c:int):int {
			//analyzes the surrounding tArray cells to determine what type of wall will be built
			//returns an int, corresponding to the binary number in the table below
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
			var wallState:int = 0;
			
			if (r > 0) {//check the top
				if (tempArray[r - 1][c] == "W") {
					wallState += 8;
				}
			}		
			if (r < bDepth - 1) {//check the bottom
				if (tempArray[r + 1][c] == "W") {
					wallState += 2;
				}
			}
			if (c > 0) {//check left
				if (tempArray[r][c - 1] == "W") {
					wallState += 1;
				}
			}
			if (c < bWidth) {//check right
				if (tempArray[r][c + 1] == "W") {
					wallState += 4;
				}
				
			}
			return wallState;
			
		}
		
		
	}

}