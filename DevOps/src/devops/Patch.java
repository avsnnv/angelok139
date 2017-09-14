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
    private static ArrayList<Operator> queue=new ArrayList<>();

    public static Logger getLogger() {
        return logger;
    }

    public static void main(String[] args){
        System.out.println("File processor");
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
                    default:
                        break;
                }
            }
        }
        catch (IOException e){
            logger.IOError();
            return;
        }
        System.out.println("Bye");

    }
}
