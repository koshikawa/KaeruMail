package jp.co.skyhobbit.kaerumail {
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public class Husband {

		/**
		 * 妻のメールアドレスを思い出す。
		 */
		public function rememberMailAddress(wife:Wife):void {
			const DEFAULT_MAIL_ADDRESS:String = "宛先メールアドレスを書いてください.";

			var path:File = File.applicationStorageDirectory.resolvePath(Constants.DATA_FILE);
			var fs:FileStream = new FileStream();

			try {
				fs.open(path, FileMode.READ);
				wife.mailAddress.text = fs.readUTF();
			} catch (error:Error) {
				wife.mailAddress.text = DEFAULT_MAIL_ADDRESS;
			} finally {
				fs.close();
			}
		}

		/**
		 * メールソフトを呼び出す。
		 * http://jmsnews.blog38.fc2.com/blog-entry-13.html
		 */
		public function sendMail(toAddress:String, subject:String):void {
			var returnMessage:String;
			if (Math.random() * 100 < 80) {
				returnMessage = "帰ります。";
			} else {
				returnMessage = "帰るよ。いつもありがとね。";
			}

			var urlString:String = "mailto:" + toAddress + "?subject=" + subject + "&body=" + returnMessage;
			var url:URLRequest = new URLRequest(urlString);
			navigateToURL(url ,"_self");
		}

	}
}
