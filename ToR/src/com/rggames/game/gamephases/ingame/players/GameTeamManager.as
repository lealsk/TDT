package com.rggames.game.gamephases.ingame.players
{
	import com.rggames.core.Game;
	import com.rggames.core.gamephases.ingame.players.IngamePlayer;
	import com.rggames.core.gamephases.ingame.players.TeamManager;
	
	public class GameTeamManager extends TeamManager
	{
		private var _playerA:IngamePlayer;
		private var _playerB:IngamePlayer;
		
		public function GameTeamManager()
		{
			super();
			_playerA = new TestPlayer(Game.instance.player);
			_playerB = new TestPlayer(Game.instance.player);
			addTeam(new SinglePlayerTeam(playerA,0));
			addTeam(new SinglePlayerTeam(playerB,1));
		}

		public function get playerB():IngamePlayer
		{
			return _playerB;
		}

		public function get playerA():IngamePlayer
		{
			return _playerA;
		}

	}
}