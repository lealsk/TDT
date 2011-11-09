package com.rggames.core.gamephases.ingame.units
{
	import com.rggames.core.Game;
	import com.rggames.core.events.UnitEvent;
	import com.rggames.game.render.DefaultLoadedBitmapRenderElement;
	import com.rggames.render.RenderElement;
	import com.rggames.render.bitmap.BitmapRenderElement;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;

	public class Unit implements IEventDispatcher
	{
		private var _eventDispatcher:EventDispatcher = new EventDispatcher();
		
		private var _representation:RenderElement;
		private var _position:Point;
		private var _team:int;
		private var _maxHitpoints:Number = 100;
		private var _hitpoints:Number = _maxHitpoints;
		private var _attackDamage:Number = 30;
		private var _moveSpeed:Number = 1;
		private var _dead:Boolean = false;
		private var _buildTime:Number = 1;
		private var _building:Boolean = true;
		protected var _built:Boolean = false;
		
		private var buildingTimer:Timer = new Timer(_buildTime*1000,1);
		
		public function get buildTime():Number
		{
			return _buildTime;
		}

		public function set buildTime(value:Number):void
		{
			_buildTime = value;
		}

		public function get team():int
		{
			return _team;
		}
		
		public function set team(value:int):void
		{
			_team = value;
		}
		
		public function Unit()
		{
			//_representation = new DefaultLoadedBitmapRenderElement("creep melee 1");
			_representation = new BitmapRenderElement();
			var bitmapRepresentation:BitmapRenderElement = _representation as BitmapRenderElement;
			if(bitmapRepresentation)
			{
				bitmapRepresentation.bitmap = new Bitmap(new BitmapData(20,20,true,0xFF000000));
			}
		}

		private function onBuildComplete(evt:TimerEvent):void
		{
			_building = false;
			_built = true;
			trace("UNIT BUILT!");
			dispatchEvent(new UnitEvent(this, UnitEvent.TRAINED));
			buildingTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onBuildComplete);
			activate();
		}
		
		public function get attackDamage():Number
		{
			return _attackDamage;
		}

		public function get dead():Boolean
		{
			return _dead;
		}

		public function get hitpoints():Number
		{
			return _hitpoints;
		}

		public function set hitpoints(value:Number):void
		{
			_hitpoints = value;
			if(_hitpoints<=0)
			{
				_hitpoints=0;
				Destroy();
			}
		}

		public function get position():Point
		{
			return _position;
		}

		public function set position(value:Point):void
		{
			_position = value;
			representation.position = value;
		}

		public function get representation():RenderElement
		{
			return _representation;
		}

		public function set representation(value:RenderElement):void
		{
			_representation = value;
		}
		
		public function activate():void
		{
			if(!_built)
			{
				buildingTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onBuildComplete);
				buildingTimer.start();
			}
		}
		
		public function deactivate():void
		{
		}
		
		protected function Destroy():void
		{
			_dead = true;
			UnitManager.instance.removeUnit(this);
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