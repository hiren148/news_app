package com.example.news_app

import ApiKeyHost
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ApiKeyHost.setUp(flutterEngine.dartExecutor.binaryMessenger, ApiKeyImpl())
    }
}
