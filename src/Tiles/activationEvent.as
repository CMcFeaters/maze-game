package Tiles 
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * this contains the activation event definitions
	 * @author cmcfeaters
	 */
	public class activationEvent extends EventDispatcher
	{
		public static var TILE_OCCUPIED:String = "Tile is occupied";
		public static var TILE_UNOCCUPIED:String= "Tile not occupied"
		
		public function isOccupied(isOcc:Boolean):void {
			//detects if the tile is occupied, if activates event, if not, does nothing
			if (isOcc) {
				dispatchEvent(new Event(activationEvent.TILE_OCCUPIED));
			}else {
				//possibly a non-occupied event here?
				dispatchEvent(new Event(activationEvent.TILE_UNOCCUPIED));
			}
		}
		
	}

}