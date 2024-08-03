import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'data2.dart';

class Notification {
  final String title;
  final String message;
  final DateTime date;

  Notification({required this.title, required this.message, required this.date});
}

class NotificationScreen extends StatelessWidget {
  final List<Notification> notifications = [
    Notification(
      title: "New Episode Released",
      message: "Episode 5 of 'Attack on Titan' is now available.",
      date: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Notification(
      title: "Manga Update",
      message: "'One Piece' Chapter 1001 is out now.",
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Notification(
      title: "Anime Convention",
      message: "Join us for the annual Anime Convention next weekend.",
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Notification(
      title: "New Feature",
      message: "Check out the new dark mode in the app settings.",
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    Notification(
      title: "Sale on Merchandise",
      message: "Get 20% off on all anime merchandise this week.",
      date: DateTime.now().subtract(Duration(days: 10)),
    ),
    Notification(
      title: "Live Stream Event",
      message: "Join the live stream Q&A with the creators of 'Naruto' tonight.",
      date: DateTime.now().subtract(Duration(hours: 5)),
    ),
    Notification(
      title: "New Series Added",
      message: "Watch 'My Hero Academia' now available in our catalog.",
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Notification(
      title: "Profile Update",
      message: "Update your profile to unlock new features.",
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Notification(
      title: "Exclusive Content",
      message: "Subscribers get early access to 'Demon Slayer' episodes.",
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Notification(
      title: "Weekly Newsletter",
      message: "Check out the latest news and updates in the anime world.",
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Notification(
      title: "Fan Art Contest",
      message: "Submit your fan art for a chance to be featured on our app.",
      date: DateTime.now().subtract(Duration(days: 8)),
    ),
    Notification(
      title: "Watch Party",
      message: "Join us for a watch party of 'Fullmetal Alchemist' this Friday.",
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Notification(
      title: "Season Finale",
      message: "Don't miss the season finale of 'Tokyo Revengers' airing now.",
      date: DateTime.now().subtract(Duration(hours: 1)),
    ),
    Notification(
      title: "Cosplay Event",
      message: "Participate in our virtual cosplay event next month.",
      date: DateTime.now().subtract(Duration(days: 9)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(child: Text('Notifications',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),)),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            child: ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.message),
              trailing: Text(DateFormat('yyyy-MM-dd – kk:mm').format(notification.date)),
            ),
          );
        },
      ),
    );
  }
}