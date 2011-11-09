package com.rggames.testing.interfaces
{
	import com.rggames.core.gamephases.ingame.Unit;

	public class MultipleUnitMover extends UnitMover
	{
		private var mover:UnitMover;
		
		public function MultipleUnitMover(_mover:UnitMover)
		{
			mover = _mover;
			super();
		}
		
		public function moveUnits(units:Vector.<Unit>):void
		{
			for each(var unit:Unit in units)
			{
				moveUnit(unit);
			}
		}
		
		public override function moveUnit(unit:Unit):void
		{
			mover.moveUnit(unit);
		}
	}
}