import 'package:app_liffe_task_flutter/config/app_routes.dart';
import 'package:flutter/material.dart';
// import 'package:portafolio_alexis/app/config/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alexis YA',
      theme: ThemeData(
        // fontFamily: "Poppins-Medium",
        useMaterial3: true,
      ),
      onGenerateRoute: RoutesApp.routesGeneral,
      builder: (context, child) {
        return Stack(
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(
                  1.0,
                ),
              ),
              child: child!,
            ),
          ],
        );
      },
    );
  }
}
