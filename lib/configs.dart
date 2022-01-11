import 'dart:io' show Platform;

// Stealing vars...
Map<String, String> vars = Platform.environment;

class Config {
  // Bot token
  var botToken = vars["BOT_TOKEN"]?.isEmpty ?? "YOUR_BOT_TOKEN";
  // Username
  var username = vars["USERNAME"]?.isEmpty ?? "USERNAME_OF_YOUR_BOT_(Without '@')";
}
