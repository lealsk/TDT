package com.rggames.core.gamephases.ingame.turns.events
{
	import flash.events.Event;
	
	public class TurnEvent extends Event
	{
		public static const ENDED:String = "ended";
		
		public function TurnEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}