package devops;

public class Logger {
    public void printHelp(){
        System.out.println("Help not ready yet");
    }

    public String incArgs() {
        return "Incorrect arguments, try use --help";
    }

    public void fileNotFound() {
        System.out.println("File not found");
    }

    public void IOError() {
        System.out.println("IO Error");
    }
}
