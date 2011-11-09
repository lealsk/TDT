package com.rggames.render.events
{
	import com.rggames.render.RenderElement;
	
	import flash.events.Event;
	
	public class RenderElementEvent extends Event
	{
		public static const ADDED:String = "added";
		public static const REMOVED:String = "removed";
		
		private var _element:RenderElement;
		
		public function RenderElementEvent(element:RenderElement, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_element = element;
			super(type, bubbles, cancelable);
		}

		public function get element():RenderElement
		{
			return _element;
		}

	}
}