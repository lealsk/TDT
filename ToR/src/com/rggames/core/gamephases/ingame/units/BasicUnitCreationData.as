package com.rggames.core.gamephases.ingame.units
{
	import com.rggames.core.gamephases.ingame.units.factories.UnitCreationData;
	
	import flash.geom.Point;

	public class BasicUnitCreationData extends UnitCreationData
	{
		private var _position:Point;

		public function get position():Point
		{
			return _position;
		}

		private var _type:UnitDefinition;

		public function get type():UnitDefinition
		{
			return _type;
		}

		
		public function BasicUnitCreationData(type:UnitDefinition,position:Point)
		{
			_position = position;
			_type = type;
			super();
		}
	}
}