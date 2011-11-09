package com.rggames.game.gamephases.ingame.turns
{
	import com.rggames.core.gamephases.ingame.IngamePhase;
	import com.rggames.core.gamephases.ingame.turns.TurnManager;
	import com.rggames.game.gamephases.ingame.players.GameTeamManager;
	
	public class GameTurnManager extends TurnManager
	{
		public function GameTurnManager()
		{
			super();
			var teamManager:GameTeamManager = IngamePhase.instance.teamManager as GameTeamManager;
			if(teamManager)
			{
				addTurn(new PlayerTurn(teamManager.playerA));
				addTurn(new PlayerTurn(teamManager.playerB));
				addTurn(new TimedTurn(5000));
			}
		}
	}
}