package devops;

import java.io.BufferedReader;
import java.io.IOException;

public class Change implements Operator {
    private String from;
    private String to;
    public Change(BufferedReader operationFile) throws IOException {
        try{
            String buf="";
            while(!buf.equals(">")){
                switch(buf){
                    case("from:"):{
                        from=operationFile.readLine();
                        break;
                    }
                    case("to:"):{
                        to=operationFile.readLine();
                        break;
                    }
                }
                buf=operationFile.readLine();
            }

        }
        catch(IOException e){
            Patch.getLogger().IOError();
            throw e;
        }
    }

    @Override
    public String process(String input) {
        return null;
    }
}
