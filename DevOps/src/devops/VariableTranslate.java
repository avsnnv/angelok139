package devops;

import java.net.InetAddress;
import java.util.HashMap;

public class VariableTranslate implements Operator {
    HashMap<String, String> variables = new HashMap<>();

    public VariableTranslate() {

        try {
            variables.put("$HostName", InetAddress.getLocalHost().getHostName().toString());
        } catch (java.net.UnknownHostException e) {
            e.printStackTrace();
        }
        System.out.println(variables.get("$HostName"));
    }

    @Override
    public String process(String input) {
        for(HashMap.Entry<String,String> e:variables.entrySet())
            input=input.replace(e.getKey(),e.getValue());
        return input;
    }

    @Override
    public int hashCode() {
        return 0;
    }
}

