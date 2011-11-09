package com.rggames.game.render
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	public class DefaultBitmapLoader extends BitmapLoader
	{
		[Embed(source="../assets/gameData.swf", symbol="Throne")]
		private static var ThroneClass:Class;
		
		
		[Embed(source="../assets/gameData.swf", symbol="Resource")]
		private static var ResourceClass:Class;
		
		
		[Embed(source="../assets/gameData.swf", symbol="Tower1")]
		private static var Tower1Class:Class;
		
		[Embed(source="../assets/gameData.swf", symbol="Tower2")]
		private static var Tower2Class:Class;
		
		
		[Embed(source="../assets/gameData.swf", symbol="Melee1")]
		private static var SpawnerClass:Class;
		
		
		[Embed(source="../assets/gameData.swf", symbol="CreepM1")]
		private static var CreepM1Class:Class;
		
		[Embed(source="../assets/gameData.swf", symbol="CreepM2")]
		private static var CreepM2Class:Class;
		
		[Embed(source="../assets/gameData.swf", symbol="CreepM3")]
		private static var CreepM3Class:Class;
		
		[Embed(source="../assets/gameData.swf", symbol="CreepM4")]
		private static var CreepM4Class:Class;
		
		
		[Embed(source="../assets/gameData.swf", symbol="CreepR1")]
		private static var CreepR1Class:Class;
		
		[Embed(source="../assets/gameData.swf", symbol="CreepR2")]
		private static var CreepR2Class:Class;
		
		
		[Embed(source="../assets/gameData.swf", symbol="CreepC")]
		private static var CreepCClass:Class;
		
		protected var records:Dictionary = new Dictionary();
		
		public function DefaultBitmapLoader()
		{
			super();
		}
		
		protected function recordToBitmap(name:String, asset:DisplayObject):Bitmap
		{
			return null;
		}
		
		public override function getBitmap(name:String):Bitmap
		{
			var asset:Object;
			switch(name)
			{
				case "throne":
					asset = new ThroneClass() ;
					break;
				case "tower normal":
					asset = new Tower1Class() ;
					break;
				case "tower aoe":
					asset = new Tower2Class() ;
					break;
				case "resource":
					asset = new ResourceClass() ;
					break;
				case "spawner":
					asset = new SpawnerClass() ;
					break;
				case "creep melee 1":
					asset = new CreepM1Class() ;
					break;
				case "creep melee 2":
					asset = new CreepM2Class() ;
					break;
				case "creep melee 3":
					asset = new CreepM3Class() ;
					break;
				case "creep melee 4":
					asset = new CreepM4Class() ;
					break;
				case "creep range 1":
					asset = new CreepR1Class() ;
					break;
				case "creep range 2":
					asset = new CreepR2Class() ;
					break;
				case "catapult":
					asset = new CreepCClass() ;
					break;
			}
			return recordToBitmap(name, asset as DisplayObject);
		}
	}
}