package devops;

import java.util.ArrayList;

public class HashCode {
    private String hashCode="0";

    public String getHashCode() {
        return hashCode;
    }

    public HashCode(ArrayList<Operator> queue) {
        for(Operator operator:queue)
            hashCode=((Integer)Math.abs((Integer.parseInt(hashCode)+operator.hashCode()))).toString();
    }
}
