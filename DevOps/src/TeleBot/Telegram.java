package TeleBot;

import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.net.URL;

class Telegram {
    private String token;


    Telegram(String configFile) {
        try {
            PropertiesConfiguration config = new PropertiesConfiguration();
            config.read(new FileReader(configFile));

            token = config.getString("token");
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            throw new RuntimeException();
        }

    }


    JSONObject getUpdates() {
        StringBuilder result=new StringBuilder();
        try {
            HttpsURLConnection url = (HttpsURLConnection) new URL("https://api.telegram.org/bot" + token + "/getUpdates").openConnection();
            url.setRequestMethod("GET");
            url.setDoInput(true);
            BufferedReader dis = new BufferedReader(new InputStreamReader(url.getInputStream()));
                while (dis.ready()) {
                    result.append(dis.readLine());
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
        return new JSONObject(result.toString());
    }

    int sendMessage(String chat_id,String text){
        try {
            text=text.replace(" ","%20");
            text=text.replace("\n","%0A");
            HttpPost httpPost=new HttpPost("https://api.telegram.org/bot" + token + "/sendMessage?chat_id=" + chat_id + "&text=" + text);
            CloseableHttpClient httpClient= HttpClients.createDefault();
            CloseableHttpResponse response=httpClient.execute(httpPost);

            httpClient.close();
            return response.getStatusLine().getStatusCode();
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return 500;
        }
    }
}