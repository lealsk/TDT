package com.rggames.testing.interfaces
{
	import com.rggames.core.Game;
	import com.rggames.core.gamephases.ingame.EntityManager;
	import com.rggames.core.gamephases.ingame.Unit;
	
	import flash.geom.Point;

	public class UnitSpawner
	{
		public function UnitSpawner()
		{
		}
		
		public function spawnUnit(position:Point):void
		{
			var unit:Unit = new Unit();
			unit.position = position;
			EntityManager.instance.addUnit(unit);
		}
	}
}