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
  // passing the as query params
  // 如果使用网络请求, 直接使用通过ID获取数据
  static String getDetailPage(int id) => "$detailPage?id=$id";
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
