import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_app/controllers/data_controller.dart';
import 'package:flutter_social_app/routes/route_names.dart';
import 'package:get/get.dart';
import 'my_detail_page.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  void loadingData(DataController controller) {
    Future.delayed(Duration(seconds: 1), () {
      controller.isLoading = false;
      print("We are waiting...");
    });
  }

  @override
  Widget build(BuildContext context) {
    // 注册控制器
    final DataController _controller = Get.put(DataController());
    // print("_controller loading value is ${_controller.isLoading}");
    loadingData(_controller);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;
    return Obx(
      () => _controller.isLoading == true
          ? Scaffold(
              body: Container(
                color: Color(0xFFc5e5f3),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFFc5e5f3),
              ),
              body: Container(
                color: Color(0xFFc5e5f3),
                child: SingleChildScrollView(
                  child: Container(
                    // padding: const EdgeInsets.only(top: 70),
                    child: Column(
                      children: [
                        //james smith
                        buildHeader(width, _controller),
                        SizedBox(
                          height: 30,
                        ),
                        //popular contest
                        _buildPopular(),
                        SizedBox(
                          height: 20,
                        ),
                        //list
                        _buildList(_controller, context, width),
                        SizedBox(
                          height: 30,
                        ),
                        //recent contests
                        _buildRecent(_controller),
                        SizedBox(
                          height: 20,
                        ),
                        _buildRecentList(context, _controller, width),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildRecentList(
      BuildContext context, DataController _controller, double width) {
    return ListView.builder(
        // 设置这三个属性, 可以让 ListView 自适应高度, 停止滚动
        // 当 ListView 中的子组件的高度之和小于 ListView 的高度时, ListView 会停止滚动
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _controller.dataList.length,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteNames.getDetailPage(),
                  arguments: _controller.dataList[0]);
              // Get.to(() => DetailPage());
            },
            child: Container(
              width: width,
              height: 100,
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("${_controller.dataList[i].img}"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // warning 给中间套上一个伸缩的组件, 这样就可以让文字自动换行
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "status",
                            style: TextStyle(
                                color: Color(0xFFfdebb2),
                                fontSize: 12,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: Text(
                              "adsfasdfasdfasdfasdfasdfasdfasdfasdf",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xFF3b3f42),
                                  fontSize: 18,
                                  decoration: TextDecoration.none),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        "${_controller.dataList[i].time}",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            color: Color(0xFFb2b8bb)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Container _buildRecent(DataController _controller) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        children: [
          Text(
            "Recent Contests",
            style: TextStyle(
                color: Color(0xFF1f2326),
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
          Expanded(child: Container()),
          Text(
            "Show all",
            style: TextStyle(
                color: Color(0xFFcfd5b3),
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFfdc33c)),
            child: GestureDetector(
              onTap: () {
                // nothing
              },
            ),
          )
        ],
      ),
    );
  }

  Container _buildList(
      DataController _controller, BuildContext context, double width) {
    return Container(
      height: 220,
      child: PageView.builder(
          controller: PageController(viewportFraction: 0.88),
          itemCount: _controller.dataList.length,
          itemBuilder: (_, i) {
            return GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                height: 220,
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: i.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc)),
                child: Column(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Text(
                          "${_controller.dataList[i].title}",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Expanded(child: Container())
                      ],
                    )),
                    SizedBox(height: 10),
                    Container(
                      width: width,
                      child: Text(
                        "${_controller.dataList[i].text}",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFb8eefc)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    Row(children: [
                      for (int i = 0; i < 2; i++)
                        Container(
                          width: 50,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${_controller.dataList[i].img}"),
                                    fit: BoxFit.cover)),
                          ),
                        )
                    ]),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container _buildPopular() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Row(
        children: [
          Text(
            "Popular Contest",
            style: TextStyle(
                color: Color(0xFF1f2326),
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
          Expanded(child: Container()),
          Text(
            "Show all",
            style: TextStyle(
                color: Color(0xFFcfd5b3),
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFfdc33c)),
            child: GestureDetector(),
          )
        ],
      ),
    );
  }

  Container buildHeader(double width, DataController _controller) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFebf8fd),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("img/background.jpg"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_controller.dataList[1].name}",
                  style: TextStyle(
                      color: Color(0xFF3b3f42),
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Top Level",
                  style: TextStyle(
                      color: Color(0xFFfdebb2),
                      fontSize: 12,
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            Expanded(child: Container()),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFf3fafc)),
              child: Center(
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFF69c5df),
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
