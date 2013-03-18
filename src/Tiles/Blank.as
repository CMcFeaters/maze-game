package Tiles 
{
	/**
	 * ...
	 * @author cmcfeaters
	 */
	public class Blank extends Tile
	{
		
		public var tile:Tile;
		public static var color:int = 0xFFFFFF;
		public function Blank(id:int,newX:int,newY:int,newSize:int) 
		{
			//set all initial conditions
			tile = new Tile();
			tile.size = newSize;
			tile.occupied = false;
			tile.enterable = false;
			tile.oID = -1;
			tile.lit = false;
			tile.tX = newX;
			tile.tY = newY;
			tile.tileId = id;
			
			//begin creating tile
			tile.drawTile(color);
			addChild(tile.rectangle);
			
		}
		
	}

}