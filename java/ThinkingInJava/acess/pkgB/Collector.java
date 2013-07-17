package pkgB;

import pkgA.*;

class Collector
{	

	public static void main(String[] args)
	{
		Collector co = new Collector();

		//Coin myCoin = new Coin();
		Coin getAnotherCoin = new CoinMan().getCoin();
	}
}