package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.gamephases.ingame.EntityManager;
	import com.rggames.testing.activations.Toggle;
	import com.rggames.testing.interfaces.IMoveTest;
	import com.rggames.testing.interfaces.LinearUnitMover;
	import com.rggames.testing.interfaces.MultipleUnitMover;
	import com.rggames.testing.interfaces.UnitMover;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class LeftRightMoveTest extends Test implements IMoveTest
	{
		private var _unitMover:UnitMover;
		private var linearMove:LinearUnitMover;
		private var directionTimer:Timer = new Timer(1000);
		private var direction:Number = 0;
		
		public function LeftRightMoveTest()
		{
			linearMove = new LinearUnitMover();
			_unitMover = new MultipleUnitMover(linearMove);
			super();
			activation = new Toggle(Keyboard.E);
			directionTimer.addEventListener(TimerEvent.TIMER,onChangeDirection);
			directionTimer.start();
		}
		
		private function onChangeDirection(evt:TimerEvent):void
		{
			if(direction == 0)
			{
				direction = 180;
			}
			else
			{
				direction = 0;
			}
		}
		
		protected override function activate():void
		{
			Game.instance.addEventListener(GameEvent.UPDATE, onUpdate);
		}
		
		private function onUpdate(evt:Event):void
		{
			var multipleMover:MultipleUnitMover = unitMover as MultipleUnitMover;
			if(MultipleUnitMover)
			{
				linearMove.direction = direction;
				multipleMover.moveUnits(EntityManager.instance.units);
			}
		}
		
		protected override function deactivate():void
		{
			Game.instance.removeEventListener(GameEvent.UPDATE, onUpdate);
		}
		
		public function get unitMover():UnitMover
		{
			return _unitMover;
		}
	}
}