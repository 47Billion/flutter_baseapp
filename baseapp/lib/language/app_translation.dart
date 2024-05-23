//AppTranslation.dart
abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "hi": hi,
  };
}

final Map<String, String> enUS = {
  'greeting': 'Hello, How are you?',
  'day': "Awesome day..."
};

final Map<String, String> hi = {
  'greeting': 'नमस्ते आप कैसे हैं?',
  'day': "शानदार दिन..."
};

