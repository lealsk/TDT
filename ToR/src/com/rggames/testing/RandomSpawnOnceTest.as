package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.testing.activations.Toggle;
	import com.rggames.testing.interfaces.ISpawnTest;
	import com.rggames.testing.interfaces.UnitSpawner;
	
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	public class RandomSpawnOnceTest extends Test implements ISpawnTest
	{	
		private var _unitSpawner:UnitSpawner;
		
		public function RandomSpawnOnceTest()
		{
			_unitSpawner = new UnitSpawner();
			super();
			activation = new Toggle(Keyboard.Q);
		}
		
		protected override function activate():void
		{
			for(var i:int = 0;i<400;i++)
			{
				unitSpawner.spawnUnit(new Point(500*Math.random(),500*Math.random()));
			}
		}
		
		public function get unitSpawner():UnitSpawner
		{
			return _unitSpawner;
		}
	}
}