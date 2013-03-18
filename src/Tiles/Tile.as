package Tiles 
{
	import flash.display.Sprite;
	import flash.ui.Mouse;
	import Tiles.activationEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * this is the parent class for all tiles
	 * all other tile types call this class
	 * properties
	 * 	Size
	 * 	occupation status - bool
	 * 	occupant ID - int
	 * 	enterable status - bool
	 * 	visible status-bool	//this will be altered by a board function
	 * 	rectangle - sprite
	 * 	
	 * Function
	 * 	detectOcc (takes in an x,y coordinate, determines if that coordinate falls within this tile)
	 * 	drawTile (takes in color and draws a basic rectangle)
	 * @author cmcfeaters
	 */
	public class Tile extends Sprite
	{		
		public var occupied:Boolean, enterable:Boolean, lit:Boolean;
		public var size:int, oID:int,tX:int,tY:int,tileId:int;
		public var rectangle:Sprite;
		public var actEvent:activationEvent=new activationEvent();
		
		public function Tile() {
			//declares a new rectangle and it's starting coordinates
			rectangle = new Sprite();

			
		}
		
		/*public function addOccupancyCheck():void {
			actEvent.addEventListener(activationEvent.TILE_OCCUPIED, on_tile_occupied);
			addEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		}
		
		private function on_mouse_move(e:MouseEvent):void {
			actEvent.isOccupied(detectOcc(e.localX,e.localY));
			trace("MOVEMENT (" + e.localX + "," + e.localY + ")");
			trace ("(" + tX + "," + tY + ")");
		}
		
		private function on_tile_occupied(event:Event):void {
			trace("TILE: " + tileId + " is occupied");
		}*/
		
		public function drawTile(color:int):void {
			//updates rectangle to be drawn
			rectangle.graphics.beginFill(color, 1);
			rectangle.graphics.lineStyle(0, 0x000000);
			rectangle.graphics.drawRect(tX,tY, size, size);
			rectangle.graphics.endFill();
			
		}
		
		public function detectOcc(X:int, Y:int):Boolean {
			//determiens if X,Y falls within the boundaries of this tile
			if ((X > tX && X < tX + size) && (Y > tY && Y < tY + size)) {
				//it does fall within these boundaries
				return true;
			}else {
				//it does not fall within these boundaries
				return false;
			}
			
		}

		
	
		
	}

}