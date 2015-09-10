package cn.wow.ssm.test;

public class Find {
	public static void main(String []args)
	{
		int a []={1,2,5,7,10,14,98,100,109,901};
		int b []={1,10,14,100,109};
		int low = 0;
		int high = a.length-1;
		int flag =0;
		for(int k=0;k<b.length;k++)
		{
			int value = b[k];
			low = flag;
			high = a.length-1;
			while(low<=high)
			{
				System.out.print("--------------------");
				flag =low;
				if(value==a[(low+high)/2])
				{
					System.out.println((low+high)/2);
					break;
				}
				if(value>a[(low+high)/2])
				{
					low = (low+high)/2+1;
				}
				else
				{
					high = (low+high)/2-1;
				}
			}
		
		}
	}

}
