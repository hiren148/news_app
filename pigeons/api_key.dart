import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/api_key.g.dart',
    dartOptions: DartOptions(),
    kotlinOut: 'android/app/src/main/kotlin/com/example/news_app/ApiKey.g.kt',
    kotlinOptions: KotlinOptions(),
    swiftOut: 'ios/Runner/ApiKey.g.swift',
    swiftOptions: SwiftOptions(),
    dartPackageName: 'com.example.news_app',
  ),
)

@HostApi()
abstract class ApiKeyHost {
  String getApiKey();
}
