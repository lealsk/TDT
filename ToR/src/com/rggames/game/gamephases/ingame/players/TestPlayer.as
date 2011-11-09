package com.rggames.game.gamephases.ingame.players
{
	import com.rggames.core.Game;
	import com.rggames.core.Player;
	import com.rggames.core.gamephases.ingame.players.IngamePlayer;
	import com.rggames.core.gamephases.ingame.players.economy.EconomyManager;
	import com.rggames.core.gamephases.ingame.players.events.IngamePlayerEvent;
	import com.rggames.game.gamephases.ingame.units.factories.AllUnitsFactory;
	import com.rggames.game.gamephases.ingame.units.providers.DefaultUnitProvider;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class TestPlayer extends IngamePlayer
	{
		private var currType:int = 0;
		
		public function TestPlayer(player:Player)
		{
			super(player);
			economyManager = new EconomyManager();
			unitProvider = new DefaultUnitProvider();
			unitFactory = new AllUnitsFactory();
		}
		
		public override function activate():void
		{
			super.activate();
			Game.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeydown);
			Game.instance.stage.addEventListener(MouseEvent.CLICK, onMouseDown);
		}
		
		public override function deactivate():void
		{
			super.deactivate();
			Game.instance.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeydown);
			Game.instance.stage.removeEventListener(MouseEvent.CLICK, onMouseDown);
		}
		
		private function onMouseDown(evt:MouseEvent):void
		{
			var pos:Point = new Point(evt.stageX, evt.stageY);
			buy(pos.x,pos.y,currType);
		}
		
		private function onKeydown(evt:KeyboardEvent):void
		{
			switch(evt.keyCode)
			{
				case Keyboard.ESCAPE:
					dispatchEvent(new IngamePlayerEvent(IngamePlayerEvent.EDITING_END));
					break;
				case Keyboard.NUMBER_1:
					currType = 0;
					break;
				case Keyboard.NUMBER_2:
					currType = 1;
					break;
				case Keyboard.NUMBER_3:
					currType = 2;
					break;
				case Keyboard.NUMBER_4:
					currType = 3;
					break;
				case Keyboard.NUMBER_5:
					currType = 4;
					break;
				case Keyboard.NUMBER_6:
					currType = 5;
					break;
				case Keyboard.NUMBER_7:
					currType = 6;
					break;
				case Keyboard.NUMBER_8:
					currType = 7;
					break;
				case Keyboard.NUMBER_9:
					currType = 8;
					break;
				case Keyboard.NUMBER_0:
					currType = 9;
					break;
			}
		}
	}
}