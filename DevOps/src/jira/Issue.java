package jira;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.URL;


public class Issue {
    private String project;
    private String summary;
    private String issueType;
    private Jira jira;
    private URL issueURL;

    public Issue(String project, String summary, String issueType,Jira jira) {
        this.project = project;
        this.summary = summary;
        this.issueType = issueType;
        this.jira=jira;
    }

    public String post() throws Exception{
        if(jira==null)
            return null;
        URL postIssueUrl=new URL(jira.getJiraURL()+"issue");
        HttpsURLConnection httpsURLConnection=(HttpsURLConnection)postIssueUrl.openConnection();
        httpsURLConnection.setRequestMethod("POST");
        httpsURLConnection.setRequestProperty("Content-Type","application/json");
        httpsURLConnection.setRequestProperty("Authorization","Basic "+ jira.getAuthorizationString());
        httpsURLConnection.setDoOutput(true);

        DataOutputStream dos=new DataOutputStream(httpsURLConnection.getOutputStream());
        System.out.println(this.toString());
        dos.write(this.toString().getBytes("UTF-8"));
        dos.flush();
        dos.close();

        BufferedReader br=new BufferedReader(new InputStreamReader(httpsURLConnection.getInputStream(),"UTF-8"));
        StringBuilder result=new StringBuilder();
        while(br.ready())
            result.append(br.readLine());
        br.close();
        httpsURLConnection.disconnect();
        issueURL=new URL(new JSONObject(result.toString()).get("self").toString());
        System.out.println(issueURL.getPath());
        return result.toString();
    }

    public String addAttachment(String fileName) throws Exception{
        if(issueURL==null)
            return null;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httppost = new HttpPost(issueURL+"/attachments");
        httppost.setHeader("X-Atlassian-Token", "nocheck");
        httppost.setHeader("Authorization", "Basic "+jira.getAuthorizationString());
        File fileToUpload = new File(fileName);
        FileBody fileBody = new FileBody(fileToUpload);

        HttpEntity entity = MultipartEntityBuilder.create()
                .addPart("file", fileBody)
                .build();

        httppost.setEntity(entity);
        String mess = "executing request " + httppost.getRequestLine();
        System.out.println(mess);
        CloseableHttpResponse response;

            response = httpclient.execute(httppost);

            httpclient.close();

        return response.toString();
    }


    @Override
    public String toString() {
        return String.format("{\"fields\": {\"project\":{ \"key\": \"%s\"},\"summary\": \"%s\",\"issuetype\": {\"name\": \"%s\"}}}",project,summary,issueType);
    }
}
