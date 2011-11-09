package com.rggames.core.gamephases.ingame.turns
{
	import com.rggames.core.gamephases.ingame.turns.events.TurnEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class TurnManager implements IEventDispatcher
	{
		private var _eventDispatcher:EventDispatcher = new EventDispatcher();
		
		private var turns:Vector.<Turn> = new Vector.<Turn>();
		private var _currentTurn:Turn;
		
		private var started:Boolean = false;
		
		public function clearTurns():void
		{
			turns = new Vector.<Turn>();
		}
		
		public function start():void
		{
			currentTurn.start();
			started = true;
		}
		
		public function addTurn(turn:Turn):void
		{
			if(turns.length==0)
			{
				currentTurn = turn;
			}
			turns.push(turn);
		}

		public function get currentTurn():Turn
		{
			return _currentTurn;
		}
		
		private function onTurnEnd(evt:TurnEvent):void
		{
			nextTurn();
		}
		
		public function set currentTurn(value:Turn):void
		{
			if(_currentTurn)
			{
				_currentTurn.removeEventListener(TurnEvent.ENDED, onTurnEnd);
			}
			_currentTurn = value;
			if(_currentTurn)
			{
				_currentTurn.addEventListener(TurnEvent.ENDED, onTurnEnd);
			}
			if(started)
			{
				currentTurn.start();
			}
		}

		
		public function TurnManager()
		{
		}
		
		public function nextTurn():void
		{
			var idx:int = turns.indexOf(currentTurn);
			idx++;
			if(idx>=turns.length)
			{
				idx = 0;
			}
			currentTurn = turns[idx];
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
			for each(var turn:Turn in turns)
			{
				turn.addEventListener(type, listener, useCapture, priority, useWeakReference);
			}
		}
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_eventDispatcher.removeEventListener(type, listener, useCapture);
			for each(var turn:Turn in turns)
			{
				turn.removeEventListener(type, listener, useCapture);
			}
		}
		public function dispatchEvent(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		public function hasEventListener(type:String):Boolean
		{
			return _eventDispatcher.hasEventListener(type);
		}
		public function willTrigger(type:String):Boolean
		{
			return _eventDispatcher.willTrigger(type);
		}
	}
}