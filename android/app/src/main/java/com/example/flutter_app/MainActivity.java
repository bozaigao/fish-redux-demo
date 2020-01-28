package com.example.flutter_app;

import androidx.annotation.NonNull;

import com.example.flutter_app.RsaAndBase64.RsaAndBase64;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    //rsa加密
    RsaAndBase64.registerWith(flutterEngine);
  }
}
