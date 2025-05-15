import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_social_app/models/detail_data_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  // 存储数据
  RxList<DetailDataModel> _dataList = <DetailDataModel>[].obs;
  // 暴露给View
  List<DetailDataModel> get dataList => _dataList;

  // 判断是否加载完成 View会根据这个值来判断是否显示
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
    print("onInit being called");
    _isLoading.value = true;
    print("onInit changed loading value${_isLoading.value}");
  }

  Future<void> loadJsonData() async {
    // 需要两遍转换
    final String jsonString = await rootBundle.loadString('json/detail.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    print("jsonData: ${jsonData}");
    _dataList.value =
        jsonData.map((item) => DetailDataModel.fromJson(item)).toList();
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose being called");
  }
}
