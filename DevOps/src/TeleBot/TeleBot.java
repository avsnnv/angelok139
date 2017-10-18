package TeleBot;

public class TeleBot {

    private static Telegram telegram;

    public static Telegram getTelegram() {
        return telegram;
    }

    public static void main(String[] args){
        WatchDog watchDog=new WatchDog();
        telegram=new Telegram();
        Thread thread=new Thread(watchDog);
        thread.start();

    }

}
