package com.rggames.core.gamephases.ingame.players.economy
{
	import com.rggames.core.gamephases.ingame.players.IngamePlayer;
	import com.rggames.core.gamephases.ingame.units.UnitDefinition;

	public class EconomyManager
	{
		private var owner:IngamePlayer
		
		private var _gold:Number = 300;
		
		public function EconomyManager()
		{
		}
		
		public function get gold():Number
		{
			return _gold;
		}

		public function set gold(value:Number):void
		{
			_gold = value;
			if(_gold<0)
				_gold = 0;
		}

		public function canBuy(unitdef:UnitDefinition):Boolean
		{
			return unitdef.cost<=gold;
		}
		
		public function canUpgrade(unitdef:UnitDefinition):Boolean
		{
			return true;
		}
		
		public function buy(unitdef:UnitDefinition):void
		{
			gold -= unitdef.cost;
			trace("BUYING UNIT " + unitdef.type);
		}
		
		public function upgrade(unitdef:UnitDefinition):void
		{
			
		}
	}
}