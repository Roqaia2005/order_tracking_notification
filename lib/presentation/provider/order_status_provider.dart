import 'package:flutter/material.dart';

class OrderStatusProvider with ChangeNotifier {
  String _status = "Pending";

  String get status => _status;

  void updateStatus(String newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  double get progress {
    switch (_status) {
      case "Pending":
        return 0.25;
      case "Confirmed":
        return 0.5;
      case "Shipped":
        return 0.75;
      case "Delivered":
        return 1.0;
      default:
        return 0.25;
    }
  }

  IconData get icon {
    switch (_status) {
      case "Pending":
        return Icons.access_time;
      case "Confirmed":
        return Icons.check_circle;
      case "Shipped":
        return Icons.local_shipping;
      case "Delivered":
        return Icons.check_circle_outline;
      default:
        return Icons.access_time;
    }
  }

  Color get color {
    switch (_status) {
      case "Pending":
        return Colors.orange;
      case "Confirmed":
        return Colors.green;
      case "Shipped":
        return Colors.blue;
      case "Delivered":
        return Colors.teal;
      default:
        return Colors.orange;
    }
  }
}
