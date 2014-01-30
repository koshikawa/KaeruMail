package jp.co.skyhobbit.kaerumail {
	import flash.events.MouseEvent;
	
	import spark.components.Button;

	public class View {
		private var _buttons:Vector.<Button> = new Vector.<Button>;

		public function View(func:Function):void {
			for (var i:int = 0; i < Constants.MAX_BUTTON; i++) {
				buttons[i] = new Button();
				buttons[i].id = ((i + 1) * 10).toString();
				buttons[i].label= ((i + 1) * 10) + "分後";
				if (((i + 1) % 6) == 0) {
					buttons[i].label= (((i + 1) * 10) / 60) + "時間後";
				}
				buttons[i].addEventListener(MouseEvent.CLICK, func);
			}
		}
		
		public function resizeLayout(stageWidth:int, stageHeight:int):void {
			for (var i:int = 0; i < Constants.MAX_BUTTON; i++) {
				buttons[i].x = stageWidth * 0.1;
				buttons[i].width = stageWidth * 0.8;
				buttons[i].height = stageHeight * 0.1;
			}
		}
		
		public function get buttons():Vector.<Button> {
			return _buttons;
		}

		public function set buttons(value:Vector.<Button>):void {
			_buttons = value;
		}
		
	}
}
