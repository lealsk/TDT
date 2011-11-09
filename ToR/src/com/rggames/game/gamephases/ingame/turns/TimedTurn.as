package com.rggames.game.gamephases.ingame.turns
{
	import com.rggames.core.gamephases.ingame.turns.Turn;
	import com.rggames.core.gamephases.ingame.turns.events.TurnEvent;
	import com.rggames.core.gamephases.ingame.units.Unit;
	import com.rggames.core.gamephases.ingame.units.UnitManager;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class TimedTurn extends Turn
	{
		private var timer:Timer;
		
		public function TimedTurn(duration:Number)
		{
			timer = new Timer(duration,1);
			super();
		}
		
		public override function start():void
		{
			trace("TIMER TURN STARTED");
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimer);
			timer.start();
			
			for each(var unit:Unit in UnitManager.instance.units)
			{
				unit.activate();
			}
		}
		
		private function onTimer(evt:TimerEvent):void
		{
			end();
		}
		
		protected override function end():void
		{
			trace("TIMER TURN ENDED");
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimer);
			dispatchEvent(new TurnEvent(TurnEvent.ENDED));
			
			for each(var unit:Unit in UnitManager.instance.units)
			{
				unit.deactivate();
			}
		}
	}
}