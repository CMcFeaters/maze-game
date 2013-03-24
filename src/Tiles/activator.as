package Tiles 
{
	import flash.events.Event;
	import Tiles.activationEvent;
	import flash.events.MouseEvent;
	/**
	 * an activator class
	 * will be added to a tile class and will switch super.active when conditions are met
	 * will take in operators that help determine it's conditions
	 * operators
	 * 	occupied - boolean determines if super's occupation status effects activation
	 *  other switch - array - lists other switches that effect activation status
	 * @author cmcfeaters
	 */
	public class activator 
	{
		public var actEvent:activationEvent=new activationEvent();
		public var theTile;
		
		public function activator(caller) {
			actEvent = new activationEvent();
			theTile = caller;
		}
		
		public function addOccEvent():void {
			//activates occupation event for a tile
			theTile.addEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
			actEvent.addEventListener(activationEvent.TILE_OCCUPIED, on_tile_occupied);
			actEvent.addEventListener(activationEvent.TILE_UNOCCUPIED, on_tile_unoccupied);
		}
		
		public function on_mouse_move(e:MouseEvent):void {
			actEvent.isOccupied(theTile.tile.detectOcc(e.localX, e.localY));
		}
		
		public function on_tile_occupied(e:Event):void {
			//trace (theTile.tile.tileId + " Is occupied");
			theTile.tile.occupied = true;
			
		}
		
		public function on_tile_unoccupied(e:Event):void {
			//the tile is not occupied
			theTile.tile.occupied = false;
		}
		
	}

}