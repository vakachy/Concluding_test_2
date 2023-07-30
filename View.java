import java.util.List;
import java.util.Scanner;

public class View {
    public int getValue(String title) {
        Scanner in = new Scanner(System.in);
        in.useDelimiter("\n");
        System.out.printf("%s", title);
        return in.nextInt();
    }

    public String[] getStringValue(String title) {
        Scanner sc = new Scanner(System.in);
        sc.useDelimiter("\n");
        System.out.printf("%s", title);
        String str = sc.next();
        return str.split(",");
    }

    public void showResult(boolean result) {
        if (result) {
            System.out.println("Added successfully");
        } else {
            System.out.println("Hasn't been added unfortunately");
        }
    }

    public void showResult(List<String> commands) {

        if (commands != null) {
            for (String s : commands
            ) {
                System.out.println(s);
            }
        }

    }
}
