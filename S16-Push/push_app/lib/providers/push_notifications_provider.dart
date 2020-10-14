import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

//eJu_r-YsQMavRzMu3OxH4a:APA91bGCdhDi1tPEvvEXAhMR8JvczE6tbEdq6iUVvcL7TG0dQTKS3CI6CAzxmETveMMVQD_p71UV8FQapZFXpyJXOGF6Ip6VntupzTvNEAIlyxtz2L1Q8f47VooYK9jPyONc4avLJ0Ht
class PushNotificationsProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajesStream => _mensajesStreamController.stream;

  static Future<dynamic> onBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotifications() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    print("========== FCM Token ==========");
    print(token);
    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessageHandler,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    //print("======= onMessage =======");
    //print("Mensaje: $message");
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
    //print(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print("======= onLaunch =======");
    //print("Mensaje: $message");
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
    //print(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print("======= onResume =======");
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
  }

  dispose() {
    _mensajesStreamController?.close();
  }
}
