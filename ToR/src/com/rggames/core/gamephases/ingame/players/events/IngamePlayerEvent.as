package com.rggames.core.gamephases.ingame.players.events
{
	import flash.events.Event;
	
	public class IngamePlayerEvent extends Event
	{
		public static const EDITING_END:String = "end editing";
		
		public function IngamePlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}