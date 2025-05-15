import 'package:flutter_social_app/views/content_page.dart';
import 'package:flutter_social_app/views/my_detail_page.dart';
import 'package:flutter_social_app/views/my_home_page.dart';
import 'package:get/get.dart';

class RouteNames {
  static const String initial = "/";
  static const String homePage = "/home_page";
  static const String detailPage = "/detail_page";
  static const String contentPage = "/content_page";

  static String getInitial() => initial;
  static String getDetailPage() => detailPage;
  static String getContentPage() => contentPage;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MyHomePage(),
    ),
    GetPage(name: detailPage, page: () => DetailPage()),
    GetPage(name: contentPage, page: () => ContentPage()),
  ];
}
