package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.gamephases.ingame.EntityManager;
	import com.rggames.core.gamephases.ingame.Unit;
	import com.rggames.testing.activations.Toggle;
	import com.rggames.testing.interfaces.LinearUnitMover;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Timer;

	public class SimpleMoveTest extends Test
	{
		private var directionTimer:Timer = new Timer(1000);
		private var direction:Number = 0;
		
		public function SimpleMoveTest()
		{
			super();
			directionTimer.addEventListener(TimerEvent.TIMER,onChangeDirection);
			directionTimer.start();
			activation = new Toggle(Keyboard.R);
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
			
			for each(var unit:Unit in EntityManager.instance.units)
			{
				var dir:Point = new Point(1,0);
				var mat:Matrix = new Matrix();
				mat.rotate(direction/180*Math.PI);
				dir = mat.transformPoint(dir);
				
				unit.position = new Point(unit.position.x+dir.x,unit.position.y+dir.y);
			}
		}
		
		protected override function deactivate():void
		{
			Game.instance.removeEventListener(GameEvent.UPDATE, onUpdate);
		}
	}
}