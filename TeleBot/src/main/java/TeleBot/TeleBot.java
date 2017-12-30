package TeleBot;

public class TeleBot {

    private static Telegram telegram;

    static Telegram getTelegram() {
        return telegram;
    }

    public static void main(String[] args){
        if(args.length<1)
        {
            throw new RuntimeException("Usage: TeleBot config_file");
        }
        telegram=new Telegram(args[0]);
        Thread thread=new Thread(new WatchDog());
        thread.start();

    }

}
