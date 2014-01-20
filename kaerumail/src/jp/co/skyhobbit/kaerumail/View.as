package jp.co.skyhobbit.kaerumail {
	import flash.events.MouseEvent;

	import spark.components.Button;

	public class View {
		private var _buttons:Vector.<Button> = new Vector.<Button>;

		public function get buttons():Vector.<Button> {
			return _buttons;
		}

		public function set buttons(value:Vector.<Button>):void {
			_buttons = value;
		}

		public function makeScreen(stageWidth:int, stageHeight:int):void {
			for (var i:int = 0; i < Constants.MAX_BUTTON; i++) {
				buttons[i] = new Button();
				buttons[i].id = ((i + 1) * 10).toString();
				buttons[i].x = stageWidth * 0.1 * i;
				buttons[i].y = stageHeight * 0.2 * i;
				buttons[i].width = stageWidth * 0.8;
				buttons[i].height = stageHeight * 0.08;
				buttons[i].label= ((i + 1) * 10) + "分後";
				if (((i + 1) % 6) == 0) {
					buttons[i].label= (((i + 1) * 10) / 60) + "時間後";
				}
			}
		}

		public function setEvent(func:Function):void {
			for (var i:int = 0; i < Constants.MAX_BUTTON; i++) {
				buttons[i].addEventListener(MouseEvent.CLICK, func);
			}
		}

	}
}
