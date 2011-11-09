package com.rggames.core.gamephases.ingame.players
{
	public class Team
	{
		private var players:Vector.<IngamePlayer> = new Vector.<IngamePlayer>();
		private var _index:int;
		
		public function Team(id:int)
		{
			_index = id;
		}
		
		public function get index():int
		{
			return _index;
		}

		public function addPlayer(player:IngamePlayer):void
		{
			players.push(player);
			player.team = this;
		}
	}
}