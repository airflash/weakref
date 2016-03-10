package
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;

	public class MySprite extends Sprite
	{
		private var _name:String;
		private var bd:BitmapData;

		public function MySprite(name:String, weak:Boolean)
		{
			_name = name;

			bd = new BitmapData(3000,5000);

			addEventListener(Event.ENTER_FRAME, ef,false, 0, weak);
		}

		public function ef(event:Event):void
		{
			trace(_name);
		}
	}
}
