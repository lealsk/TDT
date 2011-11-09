package com.rggames.game.gamephases.ingame
{
	import com.rggames.core.gamephases.ingame.IngamePhase;
	import com.rggames.core.gamephases.ingame.players.IngamePlayer;
	import com.rggames.game.gamephases.ingame.players.GameTeamManager;
	import com.rggames.game.gamephases.ingame.turns.GameTurnManager;
	
	public class GameIngamePhase extends IngamePhase
	{
		private var playerA:IngamePlayer;
		private var playerB:IngamePlayer;
		
		public function GameIngamePhase()
		{
			super();
			
			teamManager = new GameTeamManager();
			turnManaget = new GameTurnManager();
		}
		
		public override function start():void
		{
			turnManaget.start();
		}
	}
}