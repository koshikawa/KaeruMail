package jp.co.skyhobbit.kaerumail {
	
	
	public class Utility {
		
		public static function getHHMM(minutes:Number):String {
			var dateObject:Date = new Date();
			var hh:Number = dateObject.getHours();
			var mm:Number = dateObject.getMinutes();
			var rounding:Number = 10; // 切り上げ。分を切りの良い数値にするため。
			mm += minutes;
			mm = int((mm + rounding - 1) / rounding) * rounding;
			if (mm >= 60) {
				hh += 1;
				mm -= 60;
			}
			if (hh >= 24) {
				hh -= 24;
			}
			return (("0" + hh.toString()).substr(-2) + ("0" + mm.toString()).substr(-2)); // 前ゼロを付加する。
		}
		
	}
}
