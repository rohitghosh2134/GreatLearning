package ROHITGHOSH_DSA_LabDSA_3;

import java.io.*;
import java.util.*;

public class BalancingBrackets {
    public static void main(String args[]) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        System.out.println("Enter the String containing Brackets : ");
        String brackets = reader.readLine();

        boolean isbalanced = true;
        Deque<Character> deque = new LinkedList<>();
        for (char ch : brackets.toCharArray()) {
            if (ch == '{' || ch == '[' || ch == '(') {
                deque.addFirst(ch);
            } else {
                if (!deque.isEmpty()
                        && ((deque.peekFirst() == '{' && ch == '}')
                                || (deque.peekFirst() == '[' && ch == ']')
                                || (deque.peekFirst() == '(' && ch == ')'))) {
                    deque.removeFirst();
                } else {
                    isbalanced = false;
                }
            }
        }
        if (isbalanced)
            System.out.println("The entered String has Balanced Brackets");
        else
            System.out.println("The entered Strings do not contain Balanced Brackets");
    }

}
