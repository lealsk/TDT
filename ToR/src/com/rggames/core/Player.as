package com.rggames.core
{
	public class Player
	{
		private var _name:String;

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		
		public function Player()
		{
		}
	}
}