import 'package:teledart/model.dart';
import 'package:dart_tg_bot/helperFuncs.dart' show msgTexts;

// Start message
var startButtons = InlineKeyboardMarkup(inline_keyboard: [[InlineKeyboardButton(text: "Updates Channel", url: "https://t.me/NexaBotsUpdates")]]);

sendStartMessage(client, message) async{
  await client.sendMessage(message.chat.id, msgTexts.startMessage.replaceFirst("{mention}", message.from.first_name), reply_markup: startButtons, parse_mode: "Markdown");
}