package com.rggames.core.gamephases.ingame.players
{
	import com.rggames.core.Player;
	import com.rggames.core.gamephases.ingame.players.economy.EconomyManager;
	import com.rggames.core.gamephases.ingame.units.BasicUnitCreationData;
	import com.rggames.core.gamephases.ingame.units.Unit;
	import com.rggames.core.gamephases.ingame.units.UnitDefinition;
	import com.rggames.core.gamephases.ingame.units.UnitManager;
	import com.rggames.core.gamephases.ingame.units.factories.UnitFactory;
	import com.rggames.core.gamephases.ingame.units.providers.UnitProvider;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	public class IngamePlayer implements IEventDispatcher
	{
		private var _eventDispatcher:EventDispatcher = new EventDispatcher();
		
		private var _player:Player;
		private var _team:Team;
		private var _economyManager:EconomyManager;
		private var _unitProvider:UnitProvider;
		protected var unitFactory:UnitFactory;
		
		public function IngamePlayer(player:Player)
		{
			_player = player;
			super();
		}
		
		public function buy(x:Number, y:Number, type:int):void
		{
			var unitdef:UnitDefinition = unitProvider.getDefinition(type);
			if(economyManager.canBuy(unitdef))
			{
				economyManager.buy(unitdef);
				var unit:Unit = unitFactory.create(new BasicUnitCreationData(unitdef, new Point(x,y)));
				UnitManager.instance.addUnit(unit);
			}
		}
		
		public function upgrade(type:int):void
		{
			var unitdef:UnitDefinition = unitProvider.getDefinition(type);
			if(economyManager.canUpgrade(unitdef))
			{
				economyManager.upgrade(unitdef);
			}
		}
		
		public function get unitProvider():UnitProvider
		{
			return _unitProvider;
		}

		public function set unitProvider(value:UnitProvider):void
		{
			_unitProvider = value;
		}

		public function get economyManager():EconomyManager
		{
			return _economyManager;
		}

		public function set economyManager(value:EconomyManager):void
		{
			_economyManager = value;
		}

		public function get team():Team
		{
			return _team;
		}

		public function set team(value:Team):void
		{
			_team = value;
		}
		
		public function activate():void
		{
			trace("PLAYER",team.index,"ACTIVATED");
		}
		
		public function deactivate():void
		{
			trace("PLAYER",team.index,"DEACTIVATED");	
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