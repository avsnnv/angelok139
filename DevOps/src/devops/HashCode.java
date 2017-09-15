package devops;

import java.util.ArrayList;

public class HashCode {
    private String hashCode="";

    public String getHashCode() {
        return hashCode;
    }

    public HashCode(ArrayList<Operator> queue) {
        for(Operator operator:queue)
            hashCode+=operator.hashCode();
    }
}
