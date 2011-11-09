package com.rggames.game.gamephases.ingame.units.buildings
{
	import com.rggames.core.gamephases.ingame.units.UnitManager;
	import com.rggames.game.gamephases.ingame.UnitTypes;
	import com.rggames.game.gamephases.ingame.units.creeps.Creep;
	import com.rggames.game.gamephases.ingame.units.creeps.TestMelee1;
	import com.rggames.game.gamephases.ingame.units.creeps.TestMelee2;
	import com.rggames.game.gamephases.ingame.units.creeps.TestMelee3;
	import com.rggames.game.gamephases.ingame.units.creeps.TestMelee4;
	import com.rggames.game.gamephases.ingame.units.creeps.TestRanged1;
	import com.rggames.game.gamephases.ingame.units.creeps.TestRanged2;
	import com.rggames.game.gamephases.ingame.units.creeps.TestSiege1;
	
	import flash.geom.Point;

	public class TypedCreepSpawner extends CreepSpawner
	{
		private var _type:int;
		
		public function TypedCreepSpawner(type:int)
		{
			_type = type;
			super();
		}
		
		protected override function spawnCreep():Creep
		{
			var unit:Creep;
			switch(_type)
			{
				case UnitTypes.CREEP_CATAPULT:
					unit = new TestSiege1();
					break;
				case UnitTypes.CREEP_MELEE1:
					unit = new TestMelee1();
					break;
				case UnitTypes.CREEP_MELEE2:
					unit = new TestMelee2();
					break;
				case UnitTypes.CREEP_MELEE3:
					unit = new TestMelee3();
					break;
				case UnitTypes.CREEP_MELEE4:
					unit = new TestMelee4();
					break;
				case UnitTypes.CREEP_RANGE1:
					unit = new TestRanged1();
					break;
				case UnitTypes.CREEP_RANGE2:
					unit = new TestRanged2();
					break;
			}
			unit.position = new Point(position.x + Math.random()*20-10,position.y + Math.random()*20-10);
			UnitManager.instance.addUnit(unit);
			trace("SPAWNED CREEP!");
			return unit;
		}
	}
}