package com.rggames.core.gamephases.ingame.units
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.events.UnitEvent;
	import com.rggames.core.gamephases.ingame.units.Unit;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class UnitManager implements IEventDispatcher
	{
		private static var _instance:UnitManager = new UnitManager();

		public static function get instance():UnitManager
		{
			return _instance;
		}
		
		private var _eventDispatcher:EventDispatcher = new EventDispatcher();
		
		private var _units:Vector.<Unit> = new Vector.<Unit>();
		private var removeUnits:Vector.<Unit> = new Vector.<Unit>();
		
		public function UnitManager()
		{
			_instance = this;
			Game.instance.addEventListener(GameEvent.UPDATE,onUpdate);
		}
		
		private function onUpdate(evt:GameEvent):void
		{
			for each(var unit:Unit in removeUnits)
			{
				units.splice(units.indexOf(unit,0),1);
			}
			removeUnits = new Vector.<Unit>();
		}
		
		public function get units():Vector.<Unit>
		{
			return _units;
		}

		public function addUnit(unit:Unit):void
		{
			units.push(unit);
			dispatchEvent(new UnitEvent(unit, UnitEvent.ADDED));
		}
		
		public function removeUnit(unit:Unit):void
		{
			removeUnits.push(unit);
			dispatchEvent(new UnitEvent(unit, UnitEvent.REMOVED));
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		public function dispatchEvent(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		public function hasEventListener(type:String):Boolean
		{
			return _eventDispatcher.hasEventListener(type);
		}
		public function willTrigger(type:String):Boolean
		{
			return _eventDispatcher.willTrigger(type);
		}
	}
}