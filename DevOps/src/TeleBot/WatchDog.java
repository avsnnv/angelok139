package TeleBot;

import org.json.JSONObject;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class WatchDog implements Runnable {
    @Override
    public void run() {
        try {
            String result="";
            HttpsURLConnection url = (HttpsURLConnection) new URL("https://api.telegram.org/bot" + TeleBot.getToken() + "/getUpdates").openConnection();
            url.setRequestMethod("GET");
            url.setDoInput(true);
            BufferedReader dis = new BufferedReader(new InputStreamReader(url.getInputStream()));
            while(dis.ready()) {
                result += dis.readLine();
            }
            JSONObject jsonObject=new JSONObject(result);
            System.out.println(result);
            dis.close();
        }
        catch (Exception e){
            throw new RuntimeException();
        }
    }
}