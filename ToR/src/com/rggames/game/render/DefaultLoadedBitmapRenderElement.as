package com.rggames.game.render
{
	public class DefaultLoadedBitmapRenderElement extends LoadedBitmapRenderElement
	{
		public function DefaultLoadedBitmapRenderElement(name:String)
		{
			super(name);
			bitmapLoader = new DefaultBitmapLoader();
			bitmap = bitmapLoader.getBitmap(name);
		}
	}
}