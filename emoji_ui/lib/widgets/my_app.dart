import 'package:flutter/material.dart';
import '../screens/screens.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardPage.routeName,
      routes: {
        DashboardPage.routeName: (context) => DashboardPage(),
      },
    );
  }
}
