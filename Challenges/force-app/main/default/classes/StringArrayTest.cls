public class StringArrayTest 
{
   public static string[] generateStringArray(integer num)
   {
       string[] result= new string[]{};
           
       for(integer i=0;i< num ;i++)
       {
           result.add('Test ' + i);
       }
       
       return result; 
   }
}