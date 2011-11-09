package com.rggames.render.bitmap.events
{
	import com.rggames.render.bitmap.BitmapRenderElement;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class BitmapRenderElementSpriteEvent extends Event
	{
		public static const CHANGED:String = "changed";
		
		private var _element:BitmapRenderElement;
		private var _prevSprite:Bitmap;
		private var _newSprite:Bitmap;
		
		public function BitmapRenderElementSpriteEvent(element:BitmapRenderElement, prevSprite:Bitmap, newSprite:Bitmap, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_element = element;
			_prevSprite = prevSprite;
			_newSprite = newSprite;
			super(type, bubbles, cancelable);
		}

		public function get newSprite():Bitmap
		{
			return _newSprite;
		}

		public function get prevSprite():Bitmap
		{
			return _prevSprite;
		}

		public function get element():BitmapRenderElement
		{
			return _element;
		}

	}
}