package games.live4sales.objects {

	import games.live4sales.assets.Assets;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Aymeric
	 */
	public class Cash extends Block {
		
		private var _timerCoin:Timer;
		
		private var _coin:Coin;

		public function Cash(name:String, params:Object = null) {
			
			super(name, params);
			
			life = 1;
			
			_timerCoin = new Timer(4500);
			_timerCoin.start();
			_timerCoin.addEventListener(TimerEvent.TIMER, _createCoin);
		}
			
		override public function destroy():void {
			
			_timerCoin.start();
			_timerCoin.removeEventListener(TimerEvent.TIMER, _createCoin);
			
			super.destroy();
		}

		private function _createCoin(tEvt:TimerEvent):void {
			
			_coin = new Coin(Assets.getAtlasTexture("coin", "Defenders"));
			_ce.starling.stage.addChild(_coin);
			_coin.onDestroyed.add(_coinDestroy);
			
			_coin.x = x - width;
			_coin.y = y - height;
		}
		
		private function _coinDestroy(coin:Coin, touched:Boolean):void {
			
			_ce.starling.stage.removeChild(_coin);
			
			if (touched) {
				//add money
			}
		}

		override protected function _updateAnimation():void {
		}

	}
}