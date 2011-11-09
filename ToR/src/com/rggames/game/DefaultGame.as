package com.rggames.game
{
	import com.rggames.core.Game;
	import com.rggames.core.Player;
	import com.rggames.game.gamephases.DefaultGamePhaseManager;
	import com.rggames.render.Render;
	import com.rggames.render.bitmap.BitmapRender;
	import com.rggames.testing.BruteForceTargetingTest;
	import com.rggames.testing.LeftRightMoveTest;
	import com.rggames.testing.RandomSpawnOnceTest;
	import com.rggames.testing.SimpleMoveTest;
	import com.rggames.testing.SpawnToQuantityTest;
	import com.rggames.testing.Test;
	import com.rggames.testing.TestManager;
	import com.rggames.testing.TimedSpawnerTest;
	
	import flash.display.Sprite;
	
	import net.hires.debug.Stats;
	
	[SWF(width='750',height='550',backgroundColor='#ffffff',frameRate='60')]
	public class DefaultGame extends Game
	{
		public function DefaultGame()
		{
			super();
			
			player = new Player();
			
			phaseManager = new DefaultGamePhaseManager();
			phaseManager.start();
			
			render = new BitmapRender();
			
			/*var testManager:TestManager = new TestManager();
			testManager.addTest(new RandomSpawnOnceTest());
			testManager.addTest(new TimedSpawnerTest());
			testManager.addTest(new LeftRightMoveTest());
			testManager.addTest(new SimpleMoveTest());
			testManager.addTest(new BruteForceTargetingTest());
			testManager.addTest(new SpawnToQuantityTest(400));*/
			
			var stats:Stats = new Stats();
			addChild(stats);
		}
	}
}