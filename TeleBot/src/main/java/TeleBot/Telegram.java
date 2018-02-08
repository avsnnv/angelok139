package TeleBot;

import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.http.HttpHost;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.DefaultRoutePlanner;
import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

class Telegram {
    private String token;
    private String proxy_host;
    private Integer proxy_port;


    Telegram(String configFile) {
        try {
            PropertiesConfiguration config = new PropertiesConfiguration();
            config.read(new FileReader(configFile));

            token = config.getString("token");
            try{
                proxy_host = config.getString("proxy_host");
                proxy_port = Integer.parseInt(config.getString("proxy_port"));
                System.out.println("Using proxy:" +proxy_host+":"+proxy_port);

            }
            catch (Exception e){
                System.out.println("Proxy not set");
            }

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
    /*        text=text.replace("%","");
            text=text.replace(" ","%20");
            text=text.replace("\n","%0A");*/
            text= URLEncoder.encode(text,"UTF-8");

            HttpPost httpPost=new HttpPost("https://api.telegram.org/bot" + token + "/sendMessage?chat_id=" + chat_id + "&text=" + text);
            CloseableHttpClient httpClient= HttpClients.createDefault();
            if(proxy_host!=null) {
                HttpHost httpHost = new HttpHost(proxy_host, proxy_port);
                RequestConfig config= RequestConfig.custom().setProxy(httpHost).build();
                httpPost.setConfig(config);
            }
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