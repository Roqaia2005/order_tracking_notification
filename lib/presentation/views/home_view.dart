import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_notification/utils/colors.dart';
import 'package:order_tracking_notification/logic/services/FCM_service.dart';
import 'package:order_tracking_notification/presentation/widgets/custom_button.dart';
import 'package:order_tracking_notification/logic/services/local_notification_service.dart';
import 'package:order_tracking_notification/presentation/provider/order_status_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    FcmService.init();
    LocalNotificationService.init();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final orderStatusProvider = Provider.of<OrderStatusProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF5F7FB),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Tracking",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset("assets/images/logo.png", width: 80.w, height: 80.h),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Order #12345",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  orderStatusProvider.icon,
                  color: orderStatusProvider.color,
                  size: 30.r,
                ),
                title: Text(
                  "Current Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  orderStatusProvider.status,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: orderStatusProvider.color,
                  ),
                ),
              ),
            ),

            10.verticalSpace,

            Row(
              children: [
                Text(
                  "Order Progress",
                  style: TextStyle(color: Colors.black, fontSize: 18.sp),
                ),
              ],
            ),
            10.verticalSpace,

            LinearProgressIndicator(
              value: orderStatusProvider.progress,
              color: kPrimaryColor,
              backgroundColor: kSecondaryColor,
            ),
            30.verticalSpace,

            Text(
              "Change Order Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,

            Column(
              children: [
                CustomButton(
                  newStatus: "Pending",
                  body: "Your order status changed to Pending",
                  buttonText: "Pending",
                ),

                10.verticalSpace,
                CustomButton(
                  newStatus: "Confirmed",
                  body: "Your order status changed from Pending to Confirmed",
                  buttonText: "Confirm",
                ),

                10.verticalSpace,
                CustomButton(
                  newStatus: "Shipped",
                  body: "Your order status changed from Confirmed to Shipped",
                  buttonText: "Ship",
                ),

                10.verticalSpace,

                CustomButton(
                  newStatus: "Delivered",
                  body: "Your order status changed from Shipped to Delivered",
                  buttonText: "Deliver",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
