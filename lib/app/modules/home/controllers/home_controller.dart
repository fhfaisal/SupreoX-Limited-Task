import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supreox/app/data/menu_response.dart';

import '../model/menu-model.dart';

class HomeController extends GetxController {
  var menuItems = <MenuItem>[].obs;
  var vat = 0.obs;
  var note = ''.obs;

  double get subtotal => menuItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get total => subtotal + (subtotal * (vat.value / 100));

  @override
  void onInit() {
    super.onInit();
    fetchMenuData();
  }

  Future<MenuResponse?> getMenuDataApi() async {
    String getData = "https://flutter.abctheme.com/api";
    var dioClient = Dio();
    dioClient.options.headers['Accept'] = "application/json";
    dioClient.options.headers['content-Type'] = 'application/json';
    dioClient.options.headers['Access-Control-Allow-Origin'] = '*';
    dioClient.options.headers["X-Requested-With"] = "XMLHttpRequest";
    dioClient.options.headers['Access-Control-Allow-Credentials'] = true;
    dioClient.options.headers['Access-Control-Allow-Headers'] = {
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
    };
    dioClient.options.headers['Access-Control-Allow-Methods'] =
    "POST, GET, OPTIONS, PUT, DELETE, HEAD";
    try {
      final response = await dioClient.get(getData);
      print(response);
      if (response.statusCode == 200) {
        return MenuResponse.fromJson(response.data);
      } else {
        print(response.data["note"]);
      }
    } on DioException catch (e) {
      if ("${e.type}" == "DioExceptionType.connectionError") {
        debugPrint("Your internet connection is unstable. Please re-check or try again later.");
      }
      debugPrint('DIO error getMenuDataApi: ${e.response}');
    }
    return null;
  }

  Future<void> fetchMenuData() async {
    var response = await getMenuDataApi();
    if (response != null) {
      menuItems.value = response.menu?.map((item) {
        return MenuItem(
          name: item.name ?? '',
          price: item.price?.toDouble() ?? 0.0,
          imageUrl: item.image ?? '',
          quantity: 0,
        );
      }).toList() ?? [];
      vat.value = response.vat ?? 0;
      note.value = response.note ?? '';
    }
  }

  void incrementQuantity(MenuItem item) {
    item.quantity++;
    menuItems.refresh();
  }

  void decrementQuantity(MenuItem item) {
    if (item.quantity > 0) {
      item.quantity--;
      menuItems.refresh();
    }
  }
}