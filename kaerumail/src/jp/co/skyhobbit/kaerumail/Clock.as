package jp.co.skyhobbit.kaerumail {
	/**
	 * 時計クラス
	 */
	public class Clock {
		
		/**
		 * 帰宅時間を返す。
		 */
		public static function getHHMM(minutes:Number, separator:Boolean):String {
			const MINUTES_UNIT:int = 10; // 分を切りの良い数値にするための単位。
			
			var dateObject:Date = new Date();
			var hh:Number = dateObject.getHours();
			var mm:Number = dateObject.getMinutes();
			mm = int((mm + minutes + MINUTES_UNIT - 1) / MINUTES_UNIT) * MINUTES_UNIT;
			
			hh = (hh + int(mm / 60)) % 24; 
			mm = mm % 60;
			return (twoColumn(hh) + separatorString(separator) + twoColumn(mm));
		}
		
		private static function separatorString(separator:Boolean):String {
			if (separator) {
				return ":";
			} else {
				return "";
			}
		}
		
		/**
		 * 前ゼロを付けて2桁にする。
		 */
		private static function twoColumn(number:int):String {
			return ("0" + number.toString()).substr(-2) 
		}
	}
}
