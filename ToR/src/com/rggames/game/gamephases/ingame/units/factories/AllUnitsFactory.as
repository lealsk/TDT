package com.rggames.game.gamephases.ingame.units.factories
{
	import com.rggames.core.gamephases.ingame.units.BasicUnitCreationData;
	import com.rggames.core.gamephases.ingame.units.Unit;
	import com.rggames.core.gamephases.ingame.units.factories.UnitCreationData;
	import com.rggames.core.gamephases.ingame.units.factories.UnitFactory;
	import com.rggames.game.gamephases.ingame.UnitTypes;
	import com.rggames.game.gamephases.ingame.units.buildings.AOETower;
	import com.rggames.game.gamephases.ingame.units.buildings.CreepSpawner;
	import com.rggames.game.gamephases.ingame.units.buildings.DefaultResourceBuilding;
	import com.rggames.game.gamephases.ingame.units.buildings.NormalTower;
	import com.rggames.game.gamephases.ingame.units.buildings.ResourceBuilding;
	import com.rggames.game.gamephases.ingame.units.buildings.Throne;
	import com.rggames.game.gamephases.ingame.units.buildings.TypedCreepSpawner;
	
	public class AllUnitsFactory extends UnitFactory
	{
		public function AllUnitsFactory()
		{
			super();
		}
		
		public override function create(data:UnitCreationData):Unit
		{
			var basicData:BasicUnitCreationData = data as BasicUnitCreationData;
			var unit:Unit;
			switch(basicData.type.type)
			{
				case UnitTypes.RESOURCE:
					unit = new DefaultResourceBuilding();
					break;
				case UnitTypes.SPAWNER_CATAPULT:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_CATAPULT);
					break;
				case UnitTypes.SPAWNER_MELEE_1:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_MELEE1);
					break;
				case UnitTypes.SPAWNER_MELEE_2:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_MELEE2);
					break;
				case UnitTypes.SPAWNER_MELEE_3:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_MELEE3);
					break;
				case UnitTypes.SPAWNER_MELEE_4:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_MELEE4);
					break;
				case UnitTypes.SPAWNER_RANGE_1:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_RANGE1);
					break;
				case UnitTypes.SPAWNER_RANGE_2:
					unit = new TypedCreepSpawner(UnitTypes.CREEP_RANGE2);
					break;
				case UnitTypes.TOWER_AOE:
					unit = new AOETower();
					break;
				case UnitTypes.TOWER_NORMAL:
					unit = new NormalTower();
					break;
				case UnitTypes.THRONE:
					unit = new Throne();
					break;
			}
			unit.position = basicData.position;
			return unit;
		}
	}
}