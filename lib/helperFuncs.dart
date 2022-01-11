import 'package:dart_tg_bot/configs.dart';
import 'package:dart_tg_bot/messagesTexts.dart';


// Initialze text class
var msgTexts = MessageTexts();
var config = Config();

// Function to check if the user is an admin of the chat
checkIfAdmin(client, message) async{
  var sentUser = await client.getChatMember(message.chat.id, message.from!.id);
  if (["creator", "administrator"].contains(sentUser.status)) {
    return true;
  } else {
    return false;
  }
}