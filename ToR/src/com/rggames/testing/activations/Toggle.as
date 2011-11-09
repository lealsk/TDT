package com.rggames.testing.activations
{
	public class Toggle extends Activation
	{
		private var press:PressedKey;
		
		public function Toggle(keycode:int)
		{
			super();
			press = new PressedKey(keycode);
			press.addEventListener(ActivationEvent.DEACTIVATED,onActivate);
		}
		
		private function onActivate(evt:ActivationEvent):void
		{
			press.removeEventListener(ActivationEvent.DEACTIVATED,onActivate);
			press.addEventListener(ActivationEvent.DEACTIVATED,onDeactivate);
			activate();
		}
		
		private function onDeactivate(evt:ActivationEvent):void
		{
			press.addEventListener(ActivationEvent.DEACTIVATED,onActivate);
			press.removeEventListener(ActivationEvent.DEACTIVATED,onDeactivate);
			deactivate();
		}
	}
}