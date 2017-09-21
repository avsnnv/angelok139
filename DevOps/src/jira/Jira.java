package jira;


import sun.misc.BASE64Encoder;

/**
 * Created by avih on 11.07.17.
 */
public class Jira{
    private String jiraURL;
    private String userName;
    private String password;


    public Jira(String jiraURL, String userName, String password) throws Exception {
        this.jiraURL=jiraURL;
        this.userName = userName;
        this.password = password;
    }

    public String getJiraURL() {
        return jiraURL;
    }

    public String getAuthorizationString(){
        return new BASE64Encoder().encode((userName+":"+password).getBytes());
    }

}
