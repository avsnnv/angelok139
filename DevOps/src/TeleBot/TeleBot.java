package TeleBot;

public class TeleBot {

    private static Telegram telegram;

    public static Telegram getTelegram() {
        return telegram;
    }

    public static void main(String[] args){
        if(args.length<1)
        {
            throw new RuntimeException("Usage: TeleBot config_file");
        }
        WatchDog watchDog=new WatchDog();
        telegram=new Telegram(args[0]);
        Thread thread=new Thread(watchDog);
        thread.start();

    }

}
