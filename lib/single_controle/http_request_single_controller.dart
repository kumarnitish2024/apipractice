

import 'dart:convert';
import 'package:http/http.dart'as http;

import '../models/User_single_models.dart';

class HttpsRequestControllers{
  var base_url ="https://demo7495040.mockable.io/";
  var end_url ="student";

  Future<UserDataModel> getData() async{
    final response = await http.get(Uri.parse("$base_url/$end_url"));

    try{
      if(response.statusCode==200){

        var decodeResponse = jsonDecode(response.body);
        var models = UserDataModel.fromJson(decodeResponse);
        return models;
      }
      else{
        return UserDataModel();
      }
    }
    catch(e){
      return UserDataModel();
    }
}
}