package jira;


public class Main {

    // Args
    // add jiraURL username password project summary issuetype attachment1 attachment2 attachmentN
    //

    public static void main(String[] args) throws Exception {

        if(args.length>0) {
            switch (args[0]) {
                case "add": {
                    if(args.length<7)
                        throw new IllegalArgumentException();

                    Jira jira = new Jira(args[1], args[2], args[3]);

                    Issue issue = new Issue(args[4], args[5], args[6], jira);
                    System.out.println(issue.post());
                    for(int i=7;i<args.length;i++)
                        System.out.println(issue.addAttachment(args[i]));
                }
            }
        }
    }
}
