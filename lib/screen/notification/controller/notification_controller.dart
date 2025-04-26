import 'package:get/get.dart';
import 'package:task_api_leaning_for_project/dev_data/dev_notification_data.dart';
import 'package:task_api_leaning_for_project/model/notification_model.dart'; // 👉 এইটা important

class NotificationController extends GetxController {
  var notificationList = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    notificationList.addAll(notificationData); // 👉 এখানেই তোমার পুরা list add হচ্ছে
  }
}
