public class CredentialService {
    public String generatePassword()
    {
        String set_of_chars="abcdefghijklmnopqrstvuwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*";
        String password="";
        int numChars=set_of_chars.length();
        for(int i=1;i<=8;i++)
        {
            int randomIndex=(int)(Math.random()*(numChars));
            char randomChar=set_of_chars.charAt(randomIndex);
            password+=randomChar;
        }
        return password;
    }
    public String generateEmailAddress(String firstName,String lastName,String companyName,String deptName)
    {
        String email="";
        email=firstName.toLowerCase()+lastName.toLowerCase()+"@"+deptName+"."+companyName.toLowerCase()+".com";
        return email;
    }
    public  void showCredentials(String firstName,String email,String password)
    {
        System.out.println("Dear " + firstName + " your generated credentials are as follows");
        System.out.format("%10s %5s %5s","Email","---->",email);
        System.out.println();
        System.out.format("%10s %5s %5s","Password","---->",password);
    }
}
