package com.rggames.core.events
{
	
	
	import com.rggames.core.gamephases.ingame.units.Unit;
	
	import flash.events.Event;
	
	public class UnitEvent extends Event
	{
		public static const ADDED:String = "added";
		public static const REMOVED:String = "removed";
		public static const TRAINED:String = "trained";
		
		private var _unit:Unit;
		
		public function UnitEvent(unit:Unit, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_unit = unit;
			super(type, bubbles, cancelable);
		}

		public function get unit():Unit
		{
			return _unit;
		}

	}
}