package
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.system.System;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	public class Main extends Sprite
	{
		private var ms:MySprite;

		public function Main()
		{
			ms = null;

			createButton(0x00ff00,50,50, create);
			createButton(0xff0000,150,50, kill);
			createButton(0x0000ff,250,50, runGC);
		}

		private function runGC():void
		{
			System.gc();
		}

		private function kill():void
		{
			ms = null;
		}

		private function create():void
		{
			ms = new MySprite("s1", true);
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
