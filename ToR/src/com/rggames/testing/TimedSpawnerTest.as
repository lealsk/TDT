package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.testing.activations.ActivationEvent;
	import com.rggames.testing.activations.PressedKey;
	import com.rggames.testing.activations.Toggle;
	import com.rggames.testing.interfaces.ISpawnTest;
	import com.rggames.testing.interfaces.UnitSpawner;
	
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class TimedSpawnerTest extends Test implements ISpawnTest
	{	
		private var _unitSpawner:UnitSpawner;
		private var spawnTimer:Timer = new Timer(10);
		
		public function TimedSpawnerTest()
		{
			activation = new Toggle(Keyboard.W);
			_unitSpawner = new UnitSpawner();
			super();
			spawnTimer.addEventListener(TimerEvent.TIMER,onSpawnTimer);
		}
		
		protected override function activate():void
		{
			spawnTimer.start();
		}
		
		protected override function deactivate():void
		{
			spawnTimer.stop();
		}
		
		private function onSpawnTimer(evt:TimerEvent):void
		{
			unitSpawner.spawnUnit(new Point(500*Math.random(),500*Math.random()));
		}
		
		public function get unitSpawner():UnitSpawner
		{
			return _unitSpawner;
		}
	}
}