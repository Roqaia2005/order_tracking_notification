import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking_notification/firebase_options.dart';
import 'package:order_tracking_notification/logic/services/FCM_service.dart';
import 'package:order_tracking_notification/presentation/views/home_view.dart';
import 'package:order_tracking_notification/logic/services/local_notification_service.dart';
import 'package:order_tracking_notification/presentation/provider/order_status_provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Future.wait([FcmService.init(), LocalNotificationService.init()]);

    runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => ChangeNotifierProvider(
        create: (_) => OrderStatusProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      navigatorKey: navigatorKey,
    );
  }
}
