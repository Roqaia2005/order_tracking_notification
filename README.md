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
![WhatsApp Image 2025-06-27 at 23 49 48_29b9d246](https://github.com/user-attachments/assets/ad486ca5-1af5-46f4-a637-bc75a191fdb9)
![WhatsApp Image 2025-06-27 at 23 53 00_00be0abb](https://github.com/user-attachments/assets/9f8522ea-4b01-4657-b8f7-2b47b72fa443)
![WhatsApp Image 2025-06-27 at 23 53 13_2c31695a](https://github.com/user-attachments/assets/e5a6a0ad-2602-4758-8e4d-f7cbee2af86e)







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




