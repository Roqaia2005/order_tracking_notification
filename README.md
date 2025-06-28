# 📦 Order Tracking Notification App

A simple Flutter demo app for tracking order status updates with real-time push notifications using Firebase Cloud Messaging (FCM) and Local Notifications.  
Built for the [iSUPPLY Hackathon Challenge].

---

## 🚀 Features

- 🔔 Push notifications for order status changes:
  - ✅ Pending → Confirmed → Shipped → Delivered
- 📱 Works on Android and iOS
- 💬 Uses Local Notifications for foreground state
- 💤 Uses FCM for background & terminated states
- 📊 Visual progress tracker with LinearProgressIndicator
- 🧪 Buttons to simulate status changes
- 🎯 Designed following iSUPPLY branding & B2B pharmacy flow
- 🧠 Clean architecture using Provider for state management

---

## 📸 Screenshots
![WhatsApp Image 2025-06-28 at 22 35 33_daf3e87e](https://github.com/user-attachments/assets/b23a176f-fa47-4584-bfbd-aa0a1ea4c44a)
![WhatsApp Image 2025-06-28 at 22 35 33_8c721235](https://github.com/user-attachments/assets/e55d91f8-aeb6-4983-a3d0-af36fcec8d51)
![WhatsApp Image 2025-06-28 at 22 35 33_9767409f](https://github.com/user-attachments/assets/c6e8249a-d51d-477e-851a-d998b17cd6e1)









---

## 📦 Architecture
lib/

├── logic/services/ # Firebase & Local Notification setup

├── presentation/

│ ├── provider/ # OrderStatusProvider (using Provider)

│ ├── views/ # UI Screens (e.g., HomeView)

│ └── widgets/ # Reusable UI components (e.g., CustomButton)



---

## 🔧 Tech Stack

- Flutter 
- Firebase Cloud Messaging 
- flutter_local_notifications
- flutter_screenutil
- provider (State Management)

---

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS


---

## 📽️ Demo Scenarios

1. **📲 Foreground**  
   App is open → Change status → Instant local notification + UI progress update

2. **⬇️ Background**  
   App minimized → Change status (via Postman or Firebase Console) → System notification appears

3. **❌ Terminated**  
   App fully closed → Notification still arrives via FCM

---

⚠️ iOS push notifications setup is completed (Firebase, plist, AppDelegate).

However, due to the lack of a macOS environment, actual device testing could not be performed.



## 📱 Huawei Push Support

Huawei Push Kit is **not integrated** in this version because identity verification (bank document) is required for Huawei Developer Account activation.

The app is structured to allow easy future integration with HMS Push Kit.


## 📝 How to Run
1. Clone this repo: git clone https://github.com/Roqaia2005/order_tracking_notification
2. flutter pub get
3. flutter run

   
   ---
   
📧 Submission

This app is built for the iSUPPLY Hackathon - Push Notification Track.
The full video demo and codebase demonstrate functionality across different app states.

---
 
📩 Author

Roqaia Hassan

🎓 Faculty of Computers and Artificial Intelligence

💙 Passionate Flutter Developer




