package com.rggames.game.gamephases.ingame.units.buildings
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.events.UnitEvent;
	import com.rggames.game.gamephases.ingame.UnitTypes;
	import com.rggames.game.gamephases.ingame.units.creeps.Creep;

	public class CreepSpawner extends Building
	{
		private var slotsCount:int = 5;
		private var creepSlots:Vector.<Creep> = new Vector.<Creep>(slotsCount);
		
		public function CreepSpawner()
		{
			super();
		}
		
		private function getSpawnLocation():int
		{
			for(var i:int = 0;i<slotsCount;i++)
			{
				var slot:Creep = creepSlots[i] as Creep;
				if(!slot)
				{
					return i;
				}
			}
			return -1;
		}
		
		public override function activate():void
		{
			super.activate();
			if(_built)
			{
				Game.instance.addEventListener(GameEvent.UPDATE, onNeedSpawn);
				trace("ACTIVATED!");
			}
		}
		
		public override function deactivate():void
		{
			Game.instance.removeEventListener(GameEvent.UPDATE, onNeedSpawn);
		}
		
		private function onNeedSpawn(evt:GameEvent):void
		{
			var id:int = getSpawnLocation();
			if(id!=-1)
			{
				var unit:Creep = spawnCreep();
				creepSlots[id] = unit;
				Game.instance.removeEventListener(GameEvent.UPDATE, onNeedSpawn);
			}
		}
		
		protected function spawnCreep():Creep
		{
			return null;
		}
		
		private function onEndTrain(evt:UnitEvent):void
		{
			
		}
	}
}