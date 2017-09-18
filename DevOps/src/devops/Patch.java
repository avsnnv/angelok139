package devops;

import java.io.*;
import java.util.ArrayList;

public class Patch {
    /*  This class patch one file by special command file

    */
    private static Logger logger;
    private static BufferedReader inputFile;
    private static BufferedWriter outputFile;
    private static BufferedReader operationFile;
    private static String operationFileHashCode;
    private static ArrayList<Operator> queue=new ArrayList<>();

    public static Logger getLogger() {
        return logger;
    }

    public static void main(String[] args){
        System.out.println("Patch file processor v0.0.1alpha. Alexander Vykhrishuk 2017. Free for any use\n");
        logger=new Logger();
        Settings setting=new Settings(args);
        if(setting.getStatus()<1)
            throw new RuntimeException(logger.incArgs());
        try {
            inputFile = new BufferedReader(new FileReader(setting.getInputFile()));
            operationFile = new BufferedReader(new FileReader(setting.getOperationFile()));
        }
        catch (FileNotFoundException e){
            logger.fileNotFound();
            return;
        }
        try{
            outputFile=new BufferedWriter(new FileWriter(setting.getOutputFile()));
        }
        catch(IOException e){
            logger.IOError();
            return;
        }

        // Form Queue
        try {
            while (operationFile.ready()) {
                String s=operationFile.readLine();
                switch(s){
                    case("<"):{
                        while(operationFile.ready()&&!operationFile.readLine().equals(">"));
                        break;
                    }
                    case("change"):{
                        queue.add(new Change(operationFile));
                        break;
                    }
                    case("delete"):{
                        queue.add(new Delete(operationFile));
                        break;
                    }
                    case("addWord"):{
                        queue.add(new AddWord(operationFile));
                        break;
                    }
                    case("FilePatcher"):{
                        String s2="";
                        while(operationFile.ready()&&!s2.equals(">")){
                            s2=operationFile.readLine();
                            if(s2.equals("hash:")) {
                                operationFileHashCode = operationFile.readLine();
                                s2=operationFileHashCode;
                            }
                        }
                        break;

                    }

                    default:
                        break;
                }
            }
            operationFile.close();
            HashCode hashCode=new HashCode(queue);
            System.out.println("HashCode: "+hashCode.getHashCode());
            if(!operationFileHashCode.equals(hashCode.getHashCode())){
                throw new RuntimeException("Wrong Hashcode in patch file, sorry");
            }
            else
                System.out.println("Hashcode OK");
            while (inputFile.ready()){
                String str=inputFile.readLine();
                for(Operator opr:queue)
                    str=opr.process(str);
            outputFile.write(str+"\n");

            }
            inputFile.close();
            outputFile.close();
        }
        catch (IOException e){
            logger.IOError();
            return;
        }



        System.out.println("Bye");

    }
}
