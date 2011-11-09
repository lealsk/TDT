package com.rggames.core
{

	public class GamePhaseManager
	{
		protected var phases:Vector.<GamePhase> = new Vector.<GamePhase>();
		protected var _currentPhase:GamePhase;

		public function get currentPhase():GamePhase
		{
			return _currentPhase;
		}
		
		public function set currentPhase(value:GamePhase):void
		{
			_currentPhase = value;
		}
		
		public function GamePhaseManager()
		{
		}
		
		public function addPhase(phase:GamePhase):void
		{
			phases.push(phase);
			if(phases.length == 1)
			{
				currentPhase = phase;
			}
		}
		
		protected function nextPhase():void
		{
			var idx:int = phases.indexOf(_currentPhase);
			if(idx>=phases.length)
			{
				idx = 0;
			}
			_currentPhase = phases[idx];
		}
		
		public function start():void
		{
			_currentPhase.start();
		}
	}
}