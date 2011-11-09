package com.rggames.core.events
{
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const INIT:String = "init";
		public static const UPDATE:String = "update";
		public static const DRAW:String = "draw";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}