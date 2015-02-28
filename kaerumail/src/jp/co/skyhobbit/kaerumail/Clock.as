package jp.co.skyhobbit.kaerumail {
	/**
	 * 時計クラス
	 */
	public class Clock {
		
		/**
		 * 帰宅時間を返す。
		 */
		public static function getHHMM(minutes:Number):String {
			const MINUTES_UNIT:int = 10; // 分を切りの良い数値にするための単位。
			
			var dateObject:Date = new Date();
			var hh:Number = dateObject.getHours();
			var mm:Number = dateObject.getMinutes();
			mm = int((mm + minutes + MINUTES_UNIT - 1) / MINUTES_UNIT) * MINUTES_UNIT;
			
			hh = (hh + int(mm / 60)) % 24; 
			mm = mm % 60;
			return (("0" + hh.toString()).substr(-2) + separator() + ("0" + mm.toString()).substr(-2)); // 前ゼロを付加する。
		}
		
		/**
		 * 時と分の区切りを返す。
		 */
		private static function separator():String {
			return ":";
		}
	}
}
