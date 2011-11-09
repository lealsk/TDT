package com.rggames.game.gamephases
{
	import com.rggames.core.GamePhaseManager;
	import com.rggames.game.gamephases.ingame.GameIngamePhase;
	
	public class DefaultGamePhaseManager extends GamePhaseManager
	{
		public function DefaultGamePhaseManager()
		{
			super();
			addPhase(new GameIngamePhase());
		}
	}
}