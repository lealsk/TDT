package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.testing.activations.Toggle;
	import com.rggames.testing.interfaces.LinearUnitMover;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class TargetingTest extends Test
	{
		protected var activationKey:int;
		protected var visionRange:Number = 40;
		
		public function TargetingTest()
		{
			super();
			activation = new Toggle(Keyboard.A);
		}
		
		protected override function activate():void
		{
			Game.instance.addEventListener(GameEvent.UPDATE, onUpdate);
		}
		
		protected function onUpdate(evt:Event):void
		{
		}
		
		protected override function deactivate():void
		{
			Game.instance.removeEventListener(GameEvent.UPDATE, onUpdate);
		}
	}
}