package Tiles 
{
	/**
	 * properties
	 * 	wallInt - used to determine what type of wall is built
	 * 	wColor - the wall color
	 * 	rColor - rectange color
	 * functions
	 * 	build wall
	 * @author cmcfeaters
	 */
	
	 import flash.display.Sprite;
	 
	public class Wall extends Tile
	{
		
		public var tile:Tile;
		public var wColor:int=0xFF0000, rColor:int=0xCCCCCC;
		
		public function Wall(id:int,newX:int,newY:int,newSize:int,wallNum:int) 
		{
			//set variables
			tile = new Tile();
			tile.tX = newX;
			tile.tY = newY;
			tile.size = newSize;
			tile.enterable = false;
			tile.occupied = false;
			tile.tileId = id;
			tile.oID = -1;
			tile.lit = false;
			tile.drawTile(rColor);
			addChild(tile.rectangle);
			wallDraw(wallNum);
			
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
			
			/***********************
			 * note this is just drawing lines now
			 * the lines can be changed to which type of wall
			 * is placed
			 * *********************/
			
			//setup line stuff
			var line:Sprite = new Sprite();
			line.graphics.lineStyle(4, wColor);

			//these functions draw the lines in half section
			if(wallInt&8){
				//vertical top half
					line.graphics.moveTo(tile.tX + tile.size / 2, tile.tY);
					line.graphics.lineTo(tile.tX + tile.size / 2, tile.tY + tile.size / 2);
			}
			if(wallInt&2){//vertical bottom half 
					line.graphics.moveTo(tile.tX + tile.size / 2, tile.tY+tile.size);
					line.graphics.lineTo(tile.tX + tile.size / 2, tile.tY + tile.size / 2);
			}

			if(wallInt&1){//horiz left half
					line.graphics.moveTo(tile.tX + tile.size / 2, tile.tY + tile.size / 2);
					line.graphics.lineTo(tile.tX, tile.tY + tile.size / 2);
			}

			if(wallInt&4){//horiz right half
					line.graphics.moveTo(tile.tX + tile.size / 2, tile.tY + tile.size / 2);
					line.graphics.lineTo(tile.tX+tile.size, tile.tY + tile.size / 2);
			}

			if (wallInt == 0) {//4 sides
					line.graphics.beginFill(0xFF0000,1);//fill color
					line.graphics.drawRect(tile.tX + tile.size / 4, tile.tY + tile.size / 4, tile.size / 2, tile.size / 2);
					line.graphics.endFill();
			}
			addChild(line);
		}
		
	}

}