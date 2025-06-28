import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_notification/logic/services/local_notification_service.dart';
import 'package:order_tracking_notification/presentation/provider/order_status_provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.body,
    required this.buttonText,
    required this.newStatus,
    this.icon,
  });

  final String body;
  final String buttonText;
  final String newStatus;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<OrderStatusProvider>().updateStatus(newStatus);

        LocalNotificationService.showBasicNotification(
          RemoteMessage(
            notification: RemoteNotification(
              title: "Order status update with Pharma Seller",
              body: body,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 46.h),
        backgroundColor: const Color(0xff009FE2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon:
          icon != null
              ? Icon(icon, color: const Color(0xffFAFBFA))
              : const Icon(Icons.check, color: Color(0xffFAFBFA)),
      label: Text(buttonText, style: const TextStyle(color: Color(0xffFAFBFA))),
    );
  }
}
