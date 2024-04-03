class AppConfig {
  AppConfig({
    required this.appName,
    required this.flavor,
    required this.baseUrl,
  });

  final String appName;
  final Flavor flavor;
  final String baseUrl;
}

enum Flavor {
  dev,
}
