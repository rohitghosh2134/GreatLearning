
import java.util.ArrayList;
import java.util.Scanner;

public class CurrencyDenomination {
    public void sort(int arr[]) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[i]) {
                    int temp = arr[j];
                    arr[j] = arr[i];
                    arr[i] = temp;
                }
            }
        }
    }

    public void minCoins(int size,int arr[],int value)
    {
        ArrayList<Integer> coin=new ArrayList<Integer>();
        for(int i=size-1;i>=0;i--) {
            while(value>=arr[i])
            {
                coin.add(arr[i]);
                value-=arr[i];
            }
        }
        int count[]=new int[size];
        for(int i=0;i<count.length;i++)
        {
            count[i]=0;
        }
        System.out.println("Your Payment Approach in order to give min no of notes will be : - ");
        for(int i=0;i<size;i++)
        {
            for(int k=0;k<coin.size();k++)
            {
                if(arr[i]==coin.get(k))
                {
                    count[i]=count[i]+1;
                }
            }
        }
        for(int i=size-1;i>=0;i--)
        {
            if(count[i]!=0)
            {
                System.out.println(arr[i]+":"+count[i]);
            }
        }
    }
    public static void main(String[] args) {
        CurrencyDenomination ob = new CurrencyDenomination();

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the size of currency denominations");
        
        int sizeCurrency = sc.nextInt();
        
        int currencyValue[] = new int[sizeCurrency];
        
        System.out.println("Enter the Currency Denominations Value");
        
        for (int i = 0; i < sizeCurrency; i++) {
            currencyValue[i] = sc.nextInt();
        }
        
        System.out.println("The Amount You want to Pay");
        
        int amount = sc.nextInt();

        ob.sort(currencyValue);
        
        ob.minCoins(sizeCurrency,currencyValue,amount);
    }
}
