import 'package:teledart/teledart.dart';
import 'package:dart_tg_bot/helpMessages.dart';
import 'package:dart_tg_bot/helperFuncs.dart' show config;
import 'package:dart_tg_bot/antiFunctions/antiUrls.dart';
import 'package:dart_tg_bot/antiFunctions/antiAnonChannel.dart';


// Main class of the bot
var YuiBot = TeleDart(config.botToken.toString(), Event(config.username.toString()));


class YuiBase {
  // Main functon of the class
  initBot() async {
    YuiBot.start();
  }
}

void main() async {
  // Initialize the bot
  await YuiBase().initBot();
  print("✨ \x1B[36mYui\x1B[0m Started!");

  // Start command
  YuiBot.onMessage(entityType: 'bot_command', keyword: 'start').listen((message) async => await sendStartMessage(YuiBot, message));
  
  
  // Delete links that sent by users (text links supports too)
  YuiBot.onUrl().listen((message) async => await deleteUrlMessages(YuiBot, message));
  YuiBot.onTextLink().listen((message) async => await deleteUrlMessages(YuiBot, message));

  
  // Anti Anon Channel Messages
  YuiBot.onMessage().listen((message) async => await deleteAnonChannelMessages(YuiBot, message));
}