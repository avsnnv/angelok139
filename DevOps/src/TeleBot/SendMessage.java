package TeleBot;

public class SendMessage {
    public static void main(String[] args){
        Telegram telegram=new Telegram();
        String send=args[1].replace(" ","%20");
        telegram.sendMessage(args[0],send);

    }
}