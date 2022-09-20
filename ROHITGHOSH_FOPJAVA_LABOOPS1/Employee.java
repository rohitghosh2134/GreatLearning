import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Employee extends CredentialService{
    /**
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter First Name");
        String firstName = br.readLine();
        System.out.println("Enter Last Name");
        String lastName = br.readLine();
        System.out.println("Enter Company Name");
        String companyName = br.readLine();
        System.out.println("The Departments are: ");
        System.out.println("1.Technical");
        System.out.println("2.Admin");
        System.out.println("3.Human Resource");
        System.out.println("4.Legal");
        System.out.println("Choose Department Name");
        String deptName = "";
        int choice = Integer.parseInt(br.readLine());
        switch (choice) {
            case 1:
                deptName = "tech";
                break;
            case 2:
                deptName = "admin";
                break;
            case 3:
                deptName = "hr";
                break;
            case 4:
                deptName="legal";
                break;
            default:
                System.out.println("Wrong Choice");
        }
        CredentialService obj=new CredentialService();
        String emailAddress=obj.generateEmailAddress(firstName, lastName, companyName, deptName);
        String password=obj.generatePassword();
        obj.showCredentials(firstName, emailAddress, password);
    }
}