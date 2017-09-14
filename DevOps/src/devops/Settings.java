package devops;


public class Settings {
    private String inputFile;
    private String outputFile;
    private String operationFile;
    private int status=0;

    public int getStatus() {
        return status;
    }

    public String getInputFile() {
        return inputFile;
    }

    public String getOutputFile() {
        return outputFile;
    }

    public String getOperationFile() {
        return operationFile;
    }

    public Settings(String[] args) {
        for(int i=0;i<args.length;i++){
            // It's parameter?
            if(args[i].substring(0,2).compareTo("--")!=0){
                throw new RuntimeException(Patch.getLogger().incArgs());
            }
            args[i]=args[i].substring(2,args[i].length());
            String[] arg=args[i].split("=");
            switch (arg[0].toLowerCase()){
                case("inputfile"):{
                    if(arg.length==2)
                        inputFile=arg[1];
                    break;
                }
                case("outputfile"):{
                    if(arg.length==2)
                        outputFile=arg[1];
                    break;
                }
                case("patchfile"):{
                    if(arg.length==2)
                        operationFile=arg[1];
                    break;
                }
                case("help"):{
                    Patch.getLogger().printHelp();
                    status--;
                    break;
                }
                default:{
                    throw new RuntimeException(Patch.getLogger().incArgs());
                }
            }
        }
        if(inputFile!=null&&outputFile!=null&&operationFile!=null)
            status++;

    }
}
