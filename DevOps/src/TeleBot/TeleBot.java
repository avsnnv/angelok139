package TeleBot;

public class TeleBot {
    private static String token="471952952:AAH0JeD6D2E43jsSJ5kcLMkzeHI9Wac86H0"; //Must be parametized

    public static String getToken() {
        return token;
    }

    public static void main(String[] args){
        WatchDog watchDog=new WatchDog();
        Thread thread=new Thread(watchDog);
        thread.start();

    }

}
