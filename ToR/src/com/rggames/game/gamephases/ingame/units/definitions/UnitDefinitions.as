package com.rggames.game.gamephases.ingame.units.definitions
{
	import com.rggames.core.gamephases.ingame.units.UnitDefinition;
	import com.rggames.game.gamephases.ingame.UnitTypes;

	public class UnitDefinitions
	{
		public static const THRONE:UnitDefinition = new UnitDefinition(UnitTypes.THRONE,100);
		
		public static const SPAWNER_MELEE_1:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_MELEE_1,100);
		public static const SPAWNER_MELEE_2:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_MELEE_2,100);
		public static const SPAWNER_MELEE_3:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_MELEE_3,100);
		public static const SPAWNER_MELEE_4:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_MELEE_4,100);
		
		public static const SPAWNER_RANGE_1:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_RANGE_1,100);
		public static const SPAWNER_RANGE_2:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_RANGE_2,100);
		
		public static const SPAWNER_CATAPULT:UnitDefinition = new UnitDefinition(UnitTypes.SPAWNER_CATAPULT,100);
		
		public static const TOWER_NORMAL:UnitDefinition = new UnitDefinition(UnitTypes.TOWER_NORMAL,100);
		public static const TOWER_AOE:UnitDefinition = new UnitDefinition(UnitTypes.TOWER_AOE,100);
		
		public static const RESOURCE:UnitDefinition = new UnitDefinition(UnitTypes.RESOURCE,100);
	}
}