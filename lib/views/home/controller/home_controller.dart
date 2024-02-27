import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constant/color.dart';
import 'package:test_app/service/api_service.dart';
import 'package:test_app/views/home/model/home_model.dart';

class HomeCtrl extends GetxController {
  RxBool isLoading = false.obs;
  RxList<HomeModel> postList = RxList();
  RxList<HomeModel> tempPostList = RxList();

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () => getPosts());
    scrollController.addListener(_loadMoreData);
  }

  Future<void> getPosts() async {
    try {
      isLoading.value = true;
      postList.value = [];
      tempPostList.value = [];
      String result = await initConnectivity();

      if (result == "Internet available") {
        final response =
            await ApiService.get('https://jsonplaceholder.typicode.com/posts');
        if (response != null) {
          if (response.statusCode == 200) {
            final jsonData = jsonDecode(response.body);
            if (jsonData is List<dynamic>) {
              tempPostList.value =
                  List.from(jsonData.map((post) => HomeModel.fromJson(post)));
            }
            if (tempPostList.isNotEmpty) {
              for (int i = 0; i < 15; i++) {
                postList.add(tempPostList[i]);
              }
            }
          }
        }
        isLoading.value = false;
      } else {
        Get.snackbar("Internet Error ", "Please Check Internet Connection",
            overlayColor: AppColors.redColor);
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<String> initConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return "Internet available";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return "Internet available";
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.none) {
      return "No Internet available";
      // I am not connected to any network.
    } else {
      return "No Internet available";
    }
  }

  void _loadMoreData() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
      if (tempPostList.isNotEmpty) {
        if (tempPostList.length != postList.length) {
          for (int i = postList.length; i < postList.length + 10; i++) {
            if (i == tempPostList.length) {
              break;
            } else {
              postList.add(tempPostList[i]);
            }
          }
        }
      }
      isLoading.value = false;
    }
  }
}
