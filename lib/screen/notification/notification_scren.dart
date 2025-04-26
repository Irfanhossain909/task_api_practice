import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/screen/notification/controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.notificationList.length,
          itemBuilder: (context, index) {
            final notification = controller.notificationList[index];
            return ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.subTitle),
              trailing: Icon(
                notification.read ? Icons.mark_email_read : Icons.mark_email_unread,
                color: notification.read ? Colors.green : Colors.red,
              ),
            );
          },
        );
      }),
    );
  }
}
