package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.utils.Dictionary;

	public class DictionaryDemo extends Sprite
	{
		private var _dictionary:Dictionary;
		private var _weakDictionary:Dictionary;


		public function DictionaryDemo()
		{
			this.graphics.beginFill(0xffffff);
			this.graphics.drawRect(0,0,1000,1000);
			this.graphics.endFill();

			/*
			 если обьявить dictionary внутри функции - то он будет уничтожен, вне зависимости от useWeakReference
			 */

			var s1:Sprite = new Sprite();
			s1.addEventListener(Event.ENTER_FRAME, ef1);

			var s2:Sprite = new Sprite();
			s2.addEventListener(Event.ENTER_FRAME, ef2);

			_dictionary = new Dictionary();
			_dictionary[s1] = "abc";

			_weakDictionary = new Dictionary(true);
			_weakDictionary[s2] = "TEXT IN WD";

			addEventListener(MouseEvent.CLICK, runGS);
		}

		private function ef1(event:Event):void
		{
			trace("EF1: ", Math.random());
		}

		private function ef2(event:Event):void
		{
			trace("EF2: ", Math.random());
		}

		private function runGS(event:MouseEvent):void
		{
			trace("run GC");
			System.gc();
		}

		private function runGSManually():void
		{
			var ar:Array = new Array();
			for (var i:int = 0; i < 100000; i++)
			{
				ar.push(new Object());
			}
		}
	}
}
