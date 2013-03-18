package Tiles 
{
	import Tiles.activator;
	/**
	 * openspace tile
	 * 	properties
	 *  	color:int (hex)
	 * 		
	 *  
	 * @author cmcfeaters
	 */
	public class OpenSpace extends Tile
	{
		public var tile:Tile;
		public var roomNum:int;
		public static var color:int = 0xCCCCCC;
		public var temp:activator;
				
		public function OpenSpace(id:int,newX:int,newY:int,newSize:int) 
		{
			//set all initial conditions
			tile = new Tile();
			tile.size = newSize;
			tile.occupied = false;
			tile.enterable = true;
			tile.oID = -1;
			tile.tileId = id;
			tile.lit = false;
			tile.tX = newX;
			tile.tY = newY;
			roomNum = -1;
			//begin creating tile
			tile.drawTile(color);
			addChild(tile.rectangle);
			
			temp = new activator(this);
			temp.addOccEvent();
		}
		
	}

}