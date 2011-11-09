package com.rggames.core.gamephases.ingame.players
{
	public class TeamManager
	{
		private var teams:Vector.<Team> = new Vector.<Team>();
		
		public function TeamManager()
		{
		}
		
		public function addTeam(team:Team):void
		{
			teams.push(team);
		}
	}
}