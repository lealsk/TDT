package com.rggames.core.gamephases.ingame
{
	import com.rggames.core.GamePhase;
	import com.rggames.core.gamephases.ingame.players.TeamManager;
	import com.rggames.core.gamephases.ingame.turns.TurnManager;
	
	public class IngamePhase extends GamePhase
	{
		private static var _instance:IngamePhase;
		
		private var _turnManaget:TurnManager;
		private var _teamManager:TeamManager;
		
		public function IngamePhase()
		{
			super();
			_instance = this;
		}

		public static function get instance():IngamePhase
		{
			return _instance;
		}

		public function get teamManager():TeamManager
		{
			return _teamManager;
		}

		public function set teamManager(value:TeamManager):void
		{
			_teamManager = value;
		}

		public function get turnManaget():TurnManager
		{
			return _turnManaget;
		}

		public function set turnManaget(value:TurnManager):void
		{
			_turnManaget = value;
		}

	}
}