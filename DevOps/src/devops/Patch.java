package devops;

public class Patch {
    /*  This class patch one file by special command file

    */
    private static Logger logger;

    public static Logger getLogger() {
        return logger;
    }

    public static void main(String[] args){
        System.out.println("File processor");
        logger=new Logger();
        Settings setting=new Settings(args);
        if(setting.getStatus()<1)
            throw new RuntimeException(logger.incArgs());




    }
}
