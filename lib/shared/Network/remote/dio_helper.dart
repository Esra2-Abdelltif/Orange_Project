import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio ;
  static init(){
    dio=Dio(
        BaseOptions(
        baseUrl: 'https://5742-196-205-94-85.eu.ngrok.io/api/v1',
       receiveDataWhenStatusError: true,

        // connectTimeout: 5000,
        // receiveTimeout: 3000
      ),
    );
  }

  static Future<Response> getData({@required String Url,  Map<String, dynamic> Quary, String access_token})async {
   dio.options.headers={
     'Accept-Encoding':'gzip, deflate, br',
     'Authorization':access_token??'',
   };

   return await dio.get(Url,queryParameters: Quary);
  }

  static Future<Response>postData({@required String Url,Map<String,dynamic>Quary,@required Map<String,dynamic>data,String lang='en',String token,})async {
   dio.options.headers={
     'Content-Type':'application/json',
     'lang':lang ,
     'Authorization':token??'',};
    return await dio.post(Url,queryParameters: Quary,data: data);
  }
}




