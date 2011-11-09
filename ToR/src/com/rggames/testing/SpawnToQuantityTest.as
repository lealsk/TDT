package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.gamephases.ingame.EntityManager;
	import com.rggames.testing.activations.Toggle;
	import com.rggames.testing.interfaces.ISpawnTest;
	import com.rggames.testing.interfaces.UnitSpawner;
	
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class SpawnToQuantityTest extends Test implements ISpawnTest
	{	
		private var _unitSpawner:UnitSpawner;
		private var unitCount:int;
		
		public function SpawnToQuantityTest(count:int)
		{
			unitCount = count;
			_unitSpawner = new UnitSpawner();
			super();
			activation = new Toggle(Keyboard.S);
		}
		
		protected override function activate():void
		{
			Game.instance.addEventListener(GameEvent.UPDATE, onUpdate);
		}
		
		protected override function deactivate():void
		{
			Game.instance.removeEventListener(GameEvent.UPDATE, onUpdate);
		}
		
		private function onUpdate(evt:GameEvent):void
		{
			var countNeeded:int = unitCount - EntityManager.instance.units.length;
			if(countNeeded > 0)
			{
				for(var i:int = 0;i<countNeeded;i++)
				{
					unitSpawner.spawnUnit(new Point(500*Math.random(),500*Math.random()));
				}
			}
		}
		
		public function get unitSpawner():UnitSpawner
		{
			return _unitSpawner;
		}
	}
}