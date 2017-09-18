package devops;

import java.io.BufferedReader;
import java.io.IOException;

public class AddWord implements Operator {
    private String before="";
    private String after="";
    private String insString="";
    public AddWord(BufferedReader operationFile) throws IOException {
        try{
            String buf="";
            while(!buf.equals(">")){
                switch(buf){
                    case("after:"):{
                        after=operationFile.readLine();
                        break;
                    }
                    case("before:"):{
                        before=operationFile.readLine();
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
        int insert,index=0;
        if(!(input.contains(before)&&input.contains(after)))
            return input;
        while(index<input.length()){
            insert=input.indexOf(after,index)+after.length();
            int ins2=input.indexOf(before,insert);
            if(insert==ins2){
                String tmp1=input.substring(0,insert);
                String tmp2=input.substring(insert,input.length());
                input=tmp1+insString+tmp2;
                index=insert+1;
            }
            if(index<insert)
                index=insert;
            else
                index++;
        }
        return input;
    }

    @Override
    public int hashCode() {
        return super.hashCode()+before.hashCode()+after.hashCode();
    }
}
