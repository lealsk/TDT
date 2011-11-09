package com.rggames.render.bitmap
{
	import com.rggames.render.Render;
	import com.rggames.render.RenderElement;
	import com.rggames.render.bitmap.events.BitmapRenderElementSpriteEvent;
	
	import flash.display.Bitmap;
	
	public class BitmapRender extends Render
	{
		public function BitmapRender()
		{
			super();
		}
		
		public override function addElement(element:RenderElement):void
		{
			if(element is BitmapRenderElement)
			{
				var bitmapElem:BitmapRenderElement = element as BitmapRenderElement;
				super.addElement(bitmapElem);
				bitmapElem.addEventListener(BitmapRenderElementSpriteEvent.CHANGED,onSpriteChanged);
				
				if(bitmapElem.bitmap)
				{
					addChild(bitmapElem.bitmap);
				}
			}
			else
			{
				throw new Error("you must pass only BitmapRenderElements");
			}
		}
		
		public override function removeElement(element:RenderElement):void
		{
			if(element is BitmapRenderElement)
			{
				var bitmapElem:BitmapRenderElement = element as BitmapRenderElement;
				super.removeElement(bitmapElem);
				bitmapElem.removeEventListener(BitmapRenderElementSpriteEvent.CHANGED,onSpriteChanged);
				
				if(bitmapElem.bitmap)
				{
					removeChild(bitmapElem.bitmap);
				}
			}
			else
			{
				throw new Error("you must pass only BitmapRenderElements");
			}
		}
		
		private function onSpriteChanged(evt:BitmapRenderElementSpriteEvent):void
		{
			addChild(evt.newSprite);
		}
	}
}