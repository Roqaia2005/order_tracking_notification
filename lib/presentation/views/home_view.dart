import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context) {
    final orderStatusProvider = Provider.of<OrderStatusProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Tracking",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset("assets/images/logo.png", width: 80.w, height: 80.h),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: ListView(
          children: [
            Text(
              "Order #12345",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            15.verticalSpace,

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Row(
                  children: [
                    Icon(
                      orderStatusProvider.icon,
                      color: orderStatusProvider.color,
                      size: 32.r,
                    ),
                    10.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Status",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Text(
                            orderStatusProvider.status,
                            key: ValueKey(orderStatusProvider.status),
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              color: orderStatusProvider.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            20.verticalSpace,

            Text(
              "Order Progress",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.verticalSpace,
            LinearProgressIndicator(
              value: orderStatusProvider.progress,
              color: kPrimaryColor,
              backgroundColor: kSecondaryColor.withOpacity(0.4),
              minHeight: 8.h,
              borderRadius: BorderRadius.circular(10.r),
            ),

            30.verticalSpace,
            Text(
              "Change Order Status",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            10.verticalSpace,

            Column(
              children: [
                CustomButton(
                  newStatus: "Pending",
                  body: "Your order status changed to Pending",
                  buttonText: "Pending",
                  icon: Icons.access_time,
                ),
                10.verticalSpace,
                CustomButton(
                  newStatus: "Confirmed",
                  body: "Your order status changed from Pending to Confirmed",
                  buttonText: "Confirm",
                  icon: Icons.check_circle,
                ),
                10.verticalSpace,
                CustomButton(
                  newStatus: "Shipped",
                  body: "Your order status changed from Confirmed to Shipped",
                  buttonText: "Ship",
                  icon: Icons.local_shipping,
                ),
                10.verticalSpace,
                CustomButton(
                  newStatus: "Delivered",
                  body: "Your order status changed from Shipped to Delivered",
                  buttonText: "Deliver",
                  icon: Icons.check_circle_outline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
