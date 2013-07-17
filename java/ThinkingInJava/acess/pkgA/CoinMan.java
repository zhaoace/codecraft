package pkgA;

public class CoinMan
{
	
	public Coin getCoin()
	{
		return new Coin();
	}

	public static void main(String[] args)
	{
		Coin myCoin = new Coin();

		Coin getAnotherCoin = new CoinMan().getCoin();
	}
}