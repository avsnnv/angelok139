package devops;

import java.io.BufferedReader;
import java.io.IOException;

public class AddLine implements Operator{
    private String after="";
    private String insString="";
    public AddLine(BufferedReader operationFile) throws IOException {
        try{
            String buf="";
            while(!buf.equals(">")){
                switch(buf){
                    case("after:"):{
                        after=operationFile.readLine();
                        break;
                    }
                    case("insert:"):{
                        insString=operationFile.readLine();
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
        if(input.equals(after))
            return input+"\n"+insString;
        else return input;
    }
    @Override
    public int hashCode() {
        return after.hashCode()+insString.hashCode();
    }
}
