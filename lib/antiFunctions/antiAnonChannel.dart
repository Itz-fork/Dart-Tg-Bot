import 'package:dart_tg_bot/helperFuncs.dart' show checkIfAdmin;


// Delete urls function
deleteAnonChannelMessages(client, message) async{
  // Checks
  if (["private", "channel"].contains(message.chat.type)) {
    return;
  } else if (await checkIfAdmin(client, message)) {
    return;
  } else if (message.sender_chat.id == (await client.getChat(message.chat.id)).linked_chat_id) {
    return;
  }
  await client.deleteMessage(message.chat.id, message.message_id);
}