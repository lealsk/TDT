package com.rggames.testing.activations
{
	import flash.events.Event;
	
	public class ActivationEvent extends Event
	{
		public static const ACTIVATED:String = "activated";
		public static const DEACTIVATED:String = "deactivated";
		
		public function ActivationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}