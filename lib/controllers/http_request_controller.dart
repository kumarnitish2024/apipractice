import 'dart:convert';

import 'package:apipractice/models/user_data_model.dart';
import 'package:http/http.dart' as http;

class HttpRequestController{
  var BASE_URL = 'https://gorest.co.in';
  var VERSION = '/public/v2/';
  var headers = {'Authorization': 'Bearer 1dbb7941919c0b4827f9295cc83431200d1e7050eafd3c60b10641b2406c11bd'};
  

  /// get
   Future<List<UserDataModel>> getUserDetails()async{
     var url = Uri.parse("$BASE_URL${VERSION}users");
     var response = await http.get(url,headers: headers);
     if(response.statusCode == 200){
       List data = jsonDecode(response.body);
       return data.map((e) => UserDataModel.fromJson(e)).toList();
     }else{
       return List<UserDataModel>.empty();
     }
   }

   /// POST

  Future<bool> addUserDetails(Map userData)async{
     var url = Uri.parse("$BASE_URL${VERSION}users");
     var response = await http.post(url,headers:headers,body: userData);
     if(response.statusCode == 201){
       print(response);
       return true;
     }else{
       return false;
     }
  }

}