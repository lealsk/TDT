package com.rggames.game.gamephases.ingame.players
{
	import com.rggames.core.gamephases.ingame.players.IngamePlayer;
	import com.rggames.core.gamephases.ingame.players.Team;
	
	public class SinglePlayerTeam extends Team
	{
		private var player:IngamePlayer;
		
		public function SinglePlayerTeam(pl:IngamePlayer, id:int)
		{
			super(id);
			player = pl;
			addPlayer(player);
		}
	}
}