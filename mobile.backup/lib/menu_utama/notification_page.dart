import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project_tubes/login_screen/styles.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    // Meminta izin notifikasi (hanya untuk Android 13 atau lebih tinggi)
    requestNotificationPermission();

    // Inisialisasi Plugin Notifikasi
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // gunakan ikon aplikasi
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Optional: Tindakan saat notifikasi di-tap
        if (response.payload != null) {
          debugPrint('Notifikasi Diklik: ${response.payload}');
        }
      },
    );
  }

  // Fungsi untuk meminta izin notifikasi
  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  Future<void> showNotification(String title, String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      platformChannelSpecifics,
      payload: 'item x', // Optional: payload untuk data tambahan
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Check-In Reminder',
        'message': 'Don\'t forget to check-in for your gym session today!',
      },
      {
        'title': 'Yoga Class Update',
        'message': 'Your yoga class will start at 5 PM in Studio A. Get ready!',
      },
      {
        'title': 'New Promotion!',
        'message': 'Limited-time offer: 20% off on membership renewal.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyles.title),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            child: ListTile(
              title: Text(notification['title']!),
              onTap: () {
                // Tampilkan notifikasi lokal
                showNotification(
                  notification['title']!,
                  notification['message']!,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
