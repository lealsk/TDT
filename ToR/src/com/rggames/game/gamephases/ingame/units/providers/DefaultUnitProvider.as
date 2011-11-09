package com.rggames.game.gamephases.ingame.units.providers
{
	import com.rggames.core.gamephases.ingame.units.UnitDefinition;
	import com.rggames.core.gamephases.ingame.units.providers.UnitProvider;
	import com.rggames.game.gamephases.ingame.UnitTypes;
	import com.rggames.game.gamephases.ingame.units.definitions.UnitDefinitions;
	import com.rggames.game.gamephases.ingame.units.factories.AllUnitsFactory;
	
	public class DefaultUnitProvider extends UnitProvider
	{
		public function DefaultUnitProvider()
		{
			super();
		}
		
		public override function getDefinition(type:int):UnitDefinition
		{
			var def:UnitDefinition;
			switch(type)
			{
				case 0:
					def = UnitDefinitions.SPAWNER_MELEE_1;
					break;
				case 1:
					def = UnitDefinitions.SPAWNER_MELEE_2;
					break;
				case 2:
					def = UnitDefinitions.SPAWNER_MELEE_3;
					break;
				case 3:
					def = UnitDefinitions.SPAWNER_MELEE_4;
					break;
				
				case 4:
					def = UnitDefinitions.SPAWNER_RANGE_1;
					break;
				case 5:
					def = UnitDefinitions.SPAWNER_RANGE_2;
					break;
				
				case 6:
					def = UnitDefinitions.SPAWNER_CATAPULT;
					break;
				
				case 7:
					def = UnitDefinitions.TOWER_NORMAL;
					break;
				case 8:
					def = UnitDefinitions.TOWER_AOE;
					break;
				
				case 9:
					def = UnitDefinitions.RESOURCE;
					break;
			}
			return def;
		}
	}
}