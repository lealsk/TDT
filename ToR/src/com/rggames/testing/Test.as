package com.rggames.testing
{
	import com.rggames.testing.activations.Activation;
	import com.rggames.testing.activations.ActivationEvent;

	public class Test
	{
		private var _activation:Activation;

		public function get activation():Activation
		{
			return _activation;
		}

		public function set activation(value:Activation):void
		{
			if(_activation)
			{
				_activation.removeEventListener(ActivationEvent.ACTIVATED,onActivate);
				_activation.removeEventListener(ActivationEvent.DEACTIVATED,onDeactivate);
			}
			_activation = value;
			if(_activation)
			{
				_activation.addEventListener(ActivationEvent.ACTIVATED,onActivate);
				_activation.addEventListener(ActivationEvent.DEACTIVATED,onDeactivate);
			}
		}

		
		public function Test()
		{
		}
		
		private function onActivate(evt:ActivationEvent):void
		{
			activate();
		}
		
		private function onDeactivate(evt:ActivationEvent):void
		{
			deactivate();	
		}
		
		protected function activate():void
		{
			
		}
		
		protected function deactivate():void
		{
			
		}
	}
}