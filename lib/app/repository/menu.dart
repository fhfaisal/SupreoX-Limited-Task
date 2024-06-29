import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:supreox/app/data/menu_response.dart';

Future<MenuResponse?> getMenuDataApi() async {
  String getData =
      "https://flutter.abctheme.com/api";
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
    if(response.statusCode == 200){
      return MenuResponse.fromJson(response.data);
    }else{
      print(response.data["note"]);
    }
  } on DioException catch (e) {
    if("${e.type}" == "DioExceptionType.connectionError"){
      debugPrint("Your internet connection is unstable please re-check or try again later.");
    }
    debugPrint('DIO error getMenuDataApi: ${e.response}');
  }
}
