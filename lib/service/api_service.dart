
import 'dart:convert';

import 'package:cubit_get_api/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<List<UserModel>> getApi() async{

    List<UserModel> useData=[];
    try{
      var request=http.Request('GET',Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse response= await request.send();

      if(response.statusCode==200){
        var rawData= await response.stream.bytesToString();
        List<dynamic> data=jsonDecode(rawData);
        data.forEach((element) {
          UserModel userModel= UserModel.fromJson(element);
          useData.add(userModel);
        });

        return useData;
      }else{
        return [];
      }

}catch(e){
      throw e;
    }

  }
}