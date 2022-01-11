import 'package:teledart/model.dart';
import 'package:dart_tg_bot/helperFuncs.dart' show msgTexts, checkIfAdmin;


// Delete urls function
deleteUrlMessages(client, message) async{
  // Checks if the chat is private
  if (["private", "channel"].contains(message.chat.type)) {
    return;
  } else if (await checkIfAdmin(client, message)) {
    return;
  }
  var deletedUrlButtons = InlineKeyboardMarkup(inline_keyboard: [[InlineKeyboardButton(text: "Sent By", url: "tg://user?id=${message.from.id}")]]);
  var chatid = message.chat.id;
  await client.deleteMessage(chatid, message.message_id);
  var sentMsg = await client.sendMessage(chatid, msgTexts.deletedUrlMessage, reply_markup: deletedUrlButtons, parse_mode: "Markdown");
  await Future.delayed(Duration(seconds: 5));
  await client.deleteMessage(chatid, sentMsg.message_id);
}