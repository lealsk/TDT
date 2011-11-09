package com.rggames.testing.activations
{
	import com.rggames.core.Game;
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class PressedKey extends Activation
	{
		private var _keycode:int;
		
		public function PressedKey(keycode:int)
		{
			_keycode = keycode;
			super();
			
			Game.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
		}
		
		private function onKeyDown(evt:KeyboardEvent):void
		{
			if(evt.keyCode == _keycode)
			{
				Game.instance.stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				Game.instance.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
				activate();
			}
		}
		
		private function onKeyUp(evt:KeyboardEvent):void
		{
			if(evt.keyCode == _keycode)
			{
				Game.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				Game.instance.stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
				deactivate();
			}
		}
	}
}