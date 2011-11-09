package com.rggames.core
{
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.utils.Time;
	import com.rggames.render.Render;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Game extends Sprite
	{
		private var _player:Player;

		public function get player():Player
		{
			return _player;
		}

		public function set player(value:Player):void
		{
			_player = value;
		}

		
		private static var _instance:Game;
		private var _render:Render;
		
		private var _phaseManager:GamePhaseManager;

		public function get phaseManager():GamePhaseManager
		{
			return _phaseManager;
		}

		public function set phaseManager(value:GamePhaseManager):void
		{
			_phaseManager = value;
		}

		
		public function Game()
		{
			super();
			_instance = this;
			Time.instance = new Time();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		public function get render():Render
		{
			return _render;
		}

		public function set render(value:Render):void
		{
			if(_render)
			{
				removeChild(_render);
			}
			_render = value;
			if(value)
			{
				addChild(value);
			}
		}

		public static function get instance():Game
		{
			return _instance;
		}

		private function onAddedToStage(evt:Event):void
		{
			dispatchEvent(new GameEvent(GameEvent.INIT));
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		private function onEnterFrame(evt:Event):void
		{
			dispatchEvent(new GameEvent(GameEvent.UPDATE));
			dispatchEvent(new GameEvent(GameEvent.DRAW));
		}
	}
}