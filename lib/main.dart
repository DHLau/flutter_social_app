import 'package:flutter/material.dart';
import 'package:flutter_social_app/controllers/fav_controller.dart';
import 'package:flutter_social_app/routes/route_names.dart';
import 'package:get/get.dart';

void main() {
  Get.put(FavController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // GetX 的 配置
      initialRoute: "/",
      getPages: RouteNames.routes,
    );
  }
}
