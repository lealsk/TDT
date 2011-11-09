package com.rggames.testing
{
	import com.rggames.core.Game;
	import com.rggames.core.gamephases.ingame.EntityManager;
	import com.rggames.core.gamephases.ingame.Unit;
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	public class BruteForceTargetingTest extends TargetingTest
	{
		public function BruteForceTargetingTest()
		{
			super();
			activationKey = Keyboard.A;
		}
		
		protected override function onUpdate(evt:Event):void
		{
			for each(var unit:Unit in EntityManager.instance.units)
			{
				for each(var target:Unit in EntityManager.instance.units)
				{
					if(unit!=target)
					{
						if(Point.distance(unit.position,target.position)<visionRange)
						{
							if(!target.dead)
							{
								target.hitpoints-=unit.attackDamage*0.0016;
								break;
							}
						}
					}
				}
			}
		}
	}
}