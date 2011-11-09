package com.rggames.game.gamephases.ingame.turns
{
	import com.rggames.core.gamephases.ingame.players.IngamePlayer;
	import com.rggames.core.gamephases.ingame.players.events.IngamePlayerEvent;
	import com.rggames.core.gamephases.ingame.turns.Turn;
	import com.rggames.core.gamephases.ingame.turns.events.TurnEvent;

	public class PlayerTurn extends Turn
	{
		private var _player:IngamePlayer;
		
		public function PlayerTurn(player:IngamePlayer)
		{
			_player = player;
			super();
		}
		
		public override function start():void
		{
			_player.addEventListener(IngamePlayerEvent.EDITING_END, onEditingEnd);
			_player.activate();
		}
		
		private function onEditingEnd(evt:IngamePlayerEvent):void
		{
			end();
		}
		
		protected override function end():void
		{
			_player.removeEventListener(IngamePlayerEvent.EDITING_END, onEditingEnd);
			_player.deactivate();
			dispatchEvent(new TurnEvent(TurnEvent.ENDED));
		}
		
		public override function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			_player.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		public override function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			super.removeEventListener(type, listener, useCapture);
			_player.removeEventListener(type, listener, useCapture);
		}
	}
}