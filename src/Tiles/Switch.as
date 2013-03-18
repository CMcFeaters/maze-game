package Tiles 
{
	/**
	 * switches are tiles with 2 states, active/inactive.  they change color depending on the state
	 * they do not directly effect doors/events.  those events will read the switches state and do whatever
	 * they must do
	 * 
	 * properties
	 * 	active- true/false
	 * 	actColor - color of active switch
	 * 	inaColor - color of inactive switch
	 * 	constAct - do the activation conditions have to be constantly met or just once?
	 * 	actCondition - determines how the switch is activated, will be a boolean statement
	 * 		occupation - the switch is occupied
	 * 		
	 * functions
	 * 	detSwitch - detect if switch activation conditions have been met, alter switch if necessary
	 * 	
	 * @author cmcfeaters
	 */
	public class Switch 
	{
		public var active:Boolean;
		public var constAct:Boolean;
		private static var actColor:int = 0x6666CC;
		private static var inAColor:int = 0x666699;
		public var actCondition:Boolean;
		public var tile:Tile;
		
		public function Switch() 
		{
			
		}
		
	}

}