package com.example.payment_demo
import android.content.Context
import android.os.BatteryManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->


            when (call.method) {
                "getBatteryLevel" -> {
                    val batteryLevel = getBatteryLevel()
                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                }
                "getDateTime" -> {
                    val dateTime = getDateTime()
                    result.success(dateTime)
                }
                "startPayment" -> {
                    val amount = call.argument<Int>("amount")
                    val currency = call.argument<String>("currency")
                    val orderId = call.argument<String>("orderId")
                    val userName = call.argument<String>("userName")
                    result.success("결제 성공: $orderId - $amount $currency - 사용자 $userName")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getBatteryLevel(): Int {
        // Explicitly cast to BatteryManager
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    private fun getDateTime(): String {
        // Get the current date and time
        val currentDateTime = java.util.Calendar.getInstance().time
        return currentDateTime.toString()
    }


}
