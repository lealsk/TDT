package com.rggames.core.gamephases.ingame.units
{
	public class UnitDefinition
	{
		private var _type:int;
		private var _level:int = 1;
		private var _cost:Number;
		
		public function UnitDefinition(type:int, cost:Number)
		{
			_type = type;
			_cost = cost;
		}

		public function get level():int
		{
			return _level;
		}

		public function set level(value:int):void
		{
			_level = value;
		}

		public function get cost():Number
		{
			return _cost;
		}

		public function set cost(value:Number):void
		{
			_cost = value;
		}

		public function get type():int
		{
			return _type;
		}

	}
}