enum Environment { dev, prod }

abstract class AppEnvironment {
  static late String baseApiUrl;
  static late String title;
  static late Environment _environment;
  static late Map<String, String> headers;

  static Environment get environment => _environment;

  /// Sets up the environment for the application based on the given [env].
  static void setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        baseApiUrl = 'https://shopsmama.com/';
        title = 'Shops Mama';
        headers = {
          'Authorization':
              'Basic Y2tfMWU4ZjNiOTRmNmExNTlhODBjOWFjOTI4MjkyNzI5YTI4ODNjMGRlZDpjc18zZDFlYzRmZDc3ZDQyZjkyOWRjZjUxMGFjMzM4Mjg3ZDdkMGMwNjZj',
        };
        break;

      case Environment.prod:
        baseApiUrl = 'https://api-prod/';
        title = 'Flutter flavors';
        headers = {
          'Authorization':
              'Basic Y2tfMWU4ZjNiOTRmNmExNTlhODBjOWFjOTI4MjkyNzI5YTI4ODNjMGRlZDpjc18zZDFlYzRmZDc3ZDQyZjkyOWRjZjUxMGFjMzM4Mjg3ZDdkMGMwNjZj',
        };
        break;

      default:
        throw Exception('Unsupported environment: $env');
    }
  }
}
