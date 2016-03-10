package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.utils.Dictionary;

	public class EventListenerDemo extends Sprite
	{
		private var obj:MyObj
		public function EventListenerDemo()
		{
			createButton(0xff0000, 50,100, createObject);
			createButton(0x00ff00, 150,100, function():void{obj = null});
			createButton(0x0000ff, 250,100, runGS);

			System.pauseForGCIfCollectionImminent(0.5);
		}

		private function createObject():void
		{
			obj = new MyObj();
			obj.addEventListener("Lol", lolFromObj, false, 0, false);
		}

		private function lolFromObj(event:Event):void
		{
			trace("lol from obj");
		}

		private function runGS():void
		{
			trace("--- run GC ---");
			System.gc();
		}

		private function createButton(color:uint, x:int, y:int, callback:Function):void
		{
			var s:Sprite = new Sprite();
			s.graphics.beginFill(color,1);
			s.graphics.drawCircle(x,y,50);
			s.graphics.endFill();
			s.addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void {callback()});
			addChild(s);
		}
	}
}
