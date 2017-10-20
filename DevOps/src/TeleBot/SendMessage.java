package TeleBot;

public class SendMessage {
    public static void main(String[] args){
        Telegram telegram=new Telegram();
        String send=args[1].replace(" ","%20");
        Integer code=telegram.sendMessage(args[0],send);
        if(code.equals(200)) {

            System.out.println("Message sent. Code: " + code.toString());
        }
        else
            throw new RuntimeException("Message not sended. Error code:" + code.toString());
    }
}
