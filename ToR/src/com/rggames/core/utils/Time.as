package com.rggames.core.utils
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	
	import flash.utils.getTimer;

	public class Time
	{
		private static var _instance:Time;
		
		private static var _delta:Number = 0;
		
		private var lastTime:uint = 16/1000;
		private var time:uint;
		private var flag:Boolean = false;
		
		public function Time()
		{
			Game.instance.addEventListener(GameEvent.UPDATE, onUpdate);
		}
		
		public static function get delta():Number
		{
			return _delta;
		}

		public static function get instance():Time
		{
			return _instance;
		}

		public static function set instance(value:Time):void
		{
			_instance = value;
		}

		private function onUpdate(evt:GameEvent):void
		{
			time = getTimer();
			if(!flag)
			{
				flag = true;
				lastTime = time;
			}
			else
			{
				_delta = (time - lastTime)/1000;
				lastTime = time;
			}
		}
	}
}