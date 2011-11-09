package com.rggames.render
{
	import com.rggames.core.Game;
	import com.rggames.core.events.GameEvent;
	import com.rggames.core.events.UnitEvent;
	import com.rggames.core.gamephases.ingame.units.UnitManager;
	import com.rggames.render.events.RenderElementEvent;
	
	import flash.display.Sprite;
	
	public class Render extends Sprite
	{
		private var _elements:Vector.<RenderElement> = new Vector.<RenderElement>();
		private var unitManager:UnitManager;
		
		public function Render()
		{
			super();
			
			if(UnitManager.instance)
			{
				unitManager = UnitManager.instance;
				unitManager.addEventListener(UnitEvent.ADDED, onAddedUnit);
				unitManager.addEventListener(UnitEvent.REMOVED, onRemovedUnit);
			}
		}
		
		private function onAddedUnit(evt:UnitEvent):void
		{
			addElement(evt.unit.representation);
		}
		
		private function onRemovedUnit(evt:UnitEvent):void
		{
			removeElement(evt.unit.representation);
		}

		public function addElement(element:RenderElement):void
		{
			_elements.push(element);
			dispatchEvent(new RenderElementEvent(element,RenderElementEvent.ADDED));
		}
		
		public function removeElement(element:RenderElement):void
		{
			_elements.splice(_elements.indexOf(element,0),1);
			dispatchEvent(new RenderElementEvent(element,RenderElementEvent.REMOVED));
		}

		public function set elements(value:Vector.<RenderElement>):void
		{
			for each(var element:RenderElement in value)
			{
				addElement(element);
			}
		}

	}
}