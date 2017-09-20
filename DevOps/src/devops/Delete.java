package devops;

import java.io.BufferedReader;
import java.io.IOException;

public class Delete implements Operator {
    private String toDelete="";
    @Override
    public String process(String input) {
        return input.replace(toDelete,"");
    }

    public Delete(BufferedReader operationFile) throws IOException {
        try{
            String buf="";
            while(!buf.equals(">")){
                switch(buf){
                    case("delete:"):{
                        toDelete=operationFile.readLine();
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
    public int hashCode() {
        return toDelete.hashCode();
    }
}
