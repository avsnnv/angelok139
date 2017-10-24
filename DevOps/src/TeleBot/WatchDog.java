package TeleBot;

import org.json.JSONArray;
import org.json.JSONObject;


public class WatchDog implements Runnable {
    @Override
    public void run() {
        Integer last_update_id=new Integer(0);
        while(true) {
            try {



                JSONObject jsonObject = TeleBot.getTelegram().getUpdates();

                JSONArray resultJ=(JSONArray)jsonObject.get("result");
                jsonObject=(JSONObject)resultJ.get(resultJ.length()-1);
                Integer last_resolved_update_id=(Integer)jsonObject.get("update_id");
                if(last_update_id==0){
                    last_update_id=last_resolved_update_id;
                }
                if(last_update_id<last_resolved_update_id){
                    jsonObject=(JSONObject)jsonObject.get("message");
                    switch(String.valueOf(jsonObject.get("text"))){
                        case("/start"):{
                            jsonObject=(JSONObject)jsonObject.get("chat");

                            TeleBot.getTelegram().sendMessage(jsonObject.get("id").toString(),"Hello.Your%20chat_id-"+jsonObject.get("id").toString());
                            break;
                        }
                    }
                    last_update_id=last_resolved_update_id;
                }
                Thread.sleep(1000);
            } catch (Exception e) {
                for(StackTraceElement message:e.getStackTrace())
                    System.out.println(message.getMethodName());
                throw new RuntimeException();
            }
        }
    }
}