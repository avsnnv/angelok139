package TeleBot;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

public class Telegram {
    private String token = "471952952:AAH0JeD6D2E43jsSJ5kcLMkzeHI9Wac86H0"; //Must be parametized

    public Telegram() {
        try {

        } catch (Exception e) {
            throw new RuntimeException();
        }
    }


    public JSONObject getUpdates() {
        String result="";
        try {
            HttpsURLConnection url = (HttpsURLConnection) new URL("https://api.telegram.org/bot" + token + "/getUpdates").openConnection();
            url.setRequestMethod("GET");
            url.setDoInput(true);
            BufferedReader dis = new BufferedReader(new InputStreamReader(url.getInputStream()));
                while (dis.ready()) {
                    result += dis.readLine();
                }
            dis.close();
            url.disconnect();
        }
        catch(Exception e){
            for(StackTraceElement stackTraceElement:e.getStackTrace())
                System.out.println(stackTraceElement.getMethodName());
            System.out.println(e.getMessage());
            throw new RuntimeException();
        }
    return new JSONObject(result);
    }

    public void sendMessage(String chat_id,String text){
        try {
            HttpPost httpPost=new HttpPost("https://api.telegram.org/bot" + token + "/sendMessage?chat_id=" + chat_id + "&text=" + text);
            CloseableHttpClient httpClient= HttpClients.createDefault();
            httpClient.execute(httpPost);
            httpClient.close();

        }
        catch (Exception e) {
            throw new RuntimeException();
        }
    }
}