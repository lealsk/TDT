package com.rggames.testing
{
	public class TestManager
	{
		private var tests:Vector.<Test> = new Vector.<Test>();
		
		public function TestManager()
		{
		}
		
		public function addTest(test:Test):void
		{
			tests.push(test);
		}
	}
}