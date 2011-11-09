package com.rggames.render.bitmap
{
	import com.rggames.render.RenderElement;
	import com.rggames.render.bitmap.events.BitmapRenderElementSpriteEvent;
	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	public class BitmapRenderElement extends RenderElement
	{
		private var _bitmap:Bitmap;
		
		public function BitmapRenderElement()
		{
			super();
		}

		public function get bitmap():Bitmap
		{
			return _bitmap;
		}

		public function set bitmap(value:Bitmap):void
		{
			var lastBitmap:Bitmap = _bitmap;
			_bitmap = value;
			dispatchEvent(new BitmapRenderElementSpriteEvent(this,lastBitmap,_bitmap,BitmapRenderElementSpriteEvent.CHANGED));
		}
		
		public override function set position(value:Point):void
		{
			super.position = value;
			if(bitmap)
			{
				bitmap.x = value.x;
				bitmap.y = value.y;
			}
		}

	}
}