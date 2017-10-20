package TeleBot;

public class SendMessage {
    public static void main(String[] args){
        if(args.length<3){
            throw new RuntimeException("Usage SendMessage chat_id message path_to_config");
        }
        Telegram telegram=new Telegram(args[2]);
        Integer code=telegram.sendMessage(args[0],args[1]);
        if(code.equals(200)) {

            System.out.println("Message sent. Code: " + code.toString());
        }
        else
            throw new RuntimeException("Message not sended. Error code:" + code.toString());
    }
}
