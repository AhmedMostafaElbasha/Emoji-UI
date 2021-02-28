import '../presentation/presentation.dart';

class AppRoutes {
  static String home = '/home_page';
  static String orderDetails = '/order_details';

  static var routes = {
    home: (_) => HomePage(),
    orderDetails: (_) => OrderDetails(),
  };
}
