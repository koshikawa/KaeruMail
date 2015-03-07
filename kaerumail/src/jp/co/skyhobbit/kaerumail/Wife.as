package jp.co.skyhobbit.kaerumail {
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import spark.components.CheckBox;
	import spark.components.Label;
	import spark.components.TextInput;

	public class Wife {
		private var _mailAddressLabel:Label;
		private var _mailAddress:TextInput;
		private var _timeSeparator:CheckBox;

		public function Wife():void {
			mailAddressLabel = new Label();
			mailAddressLabel.text ="宛先メールアドレス";
			mailAddress = new TextInput();
			mailAddress.text = "";
			timeSeparator = new CheckBox();
			timeSeparator.selected = true;
			timeSeparator.label = "時と分の区切りにコロンを入れる";
			mailAddress.addEventListener(FocusEvent.FOCUS_OUT, saveMailAddress);
		}

		private function saveMailAddress(evt:Event):void {
			var path:File = File.applicationStorageDirectory.resolvePath(Constants.DATA_FILE);
			var fs:FileStream = new FileStream();
			fs.open(path, FileMode.WRITE);
			fs.writeUTF(mailAddress.text);
			fs.close();
		}
		
		public function resizeLayout(stageWidth:int, stageHeight:int):void {
			mailAddressLabel.x = stageWidth * 0.1;
			mailAddress.x = stageWidth * 0.1;
			mailAddress.width = stageWidth * 0.8;
			timeSeparator.x = stageWidth * 0.1;
			timeSeparator.width = stageWidth * 0.8;
		}
		
		public function get mailAddress():TextInput
		{
			return _mailAddress;
		}

		public function set mailAddress(value:TextInput):void
		{
			_mailAddress = value;
		}

		public function set mailAddressLabel(value:Label):void
		{
			_mailAddressLabel = value;
		}

		public function get mailAddressLabel():Label
		{
			return _mailAddressLabel;
		}

		public function get timeSeparator():CheckBox
		{
			return _timeSeparator;
		}
		
		public function set timeSeparator(value:CheckBox):void
		{
			_timeSeparator = value;
		}

	}
}
