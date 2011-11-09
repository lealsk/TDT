package com.rggames.testing.interfaces
{
	import com.rggames.core.gamephases.ingame.Unit;
	
	import flash.geom.Matrix;
	import flash.geom.Point;

	public class LinearUnitMover extends UnitMover
	{
		private var _direction:Number;
		
		public function LinearUnitMover()
		{
			super();
		}
		
		public function get direction():Number
		{
			return _direction;
		}

		public function set direction(value:Number):void
		{
			_direction = value;
		}

		public override function moveUnit(unit:Unit):void
		{
			var dir:Point = new Point(1,0);
			var mat:Matrix = new Matrix();
			mat.rotate(direction/180*Math.PI);
			dir = mat.transformPoint(dir);
			
			unit.position = new Point(unit.position.x+dir.x,unit.position.y+dir.y);
		}
	}
}