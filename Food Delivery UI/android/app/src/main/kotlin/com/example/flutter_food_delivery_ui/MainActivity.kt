package com.example.flutter_food_delivery_ui
+import androidx.annotation.NonNull;
+import io.flutter.embedding.android.FlutterActivity;
+import io.flutter.embedding.engine.FlutterEngine;
 import io.flutter.plugin.common.MethodChannel;
+import io.flutter.plugins.GeneratedPluginRegistrant;


class MainActivity: FlutterActivity() {
  private static final String CHANNEL = "samples.flutter.dev/battery";
 +    @Override
+    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
+        GeneratedPluginRegistrant.registerWith(flutterEngine);
+        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
+                .setMethodCallHandler(
+                    (call, result) -> {
+                        // Your existing code
+                }
+        );
+    }
}
