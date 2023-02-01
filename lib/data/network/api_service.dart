import 'package:dio/dio.dart';
import 'package:rx_getx_example/data/models/car_model.dart';
import 'package:rx_getx_example/data/models/model_two.dart';
import 'package:rx_getx_example/data/models/my_response.dart';
import 'package:rx_getx_example/data/network/api_client.dart';


class ApiService extends  ApiClient {

  // Future<MyResponse> getAllCarModelOnee() async{
  //   MyResponse myResponse = MyResponse(error: "");
  //   Response response = await dio.get("${dio.options.baseUrl}/companies");
  //   try{
  //     if(response.statusCode! >= 200 && response.statusCode! < 300){
  //       myResponse.data = CarModelOne.fromJson(response.data);
  //     }
  //   }catch(e){
  //     myResponse.error = e.toString();
  //   }
  //   return myResponse;
  // }
  Future<MyResponse> getAllCarModelOne() async{
    MyResponse myResponse = MyResponse(error: "");
    Response response = await dio.get("${dio.options.baseUrl}/companies");
    try{
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        myResponse.data = CarModelOne.fromJson(response.data);
      }
    }catch(e){
      myResponse.error = e.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getSingleCompany(int id) async{
    MyResponse myResponse = MyResponse(error: "");
    Response response = await dio.get("${dio.options.baseUrl}/companies/$id");
    try{
      if(response.statusCode! >= 200 && response.statusCode! < 300){
        myResponse.data = CarModelTwo.fromJson(response.data);
      }
    }catch(e){
      myResponse.error = e.toString();
    }
    return myResponse;
  }

}