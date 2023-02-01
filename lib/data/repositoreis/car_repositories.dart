import 'package:rx_getx_example/data/models/my_response.dart';
import 'package:rx_getx_example/data/network/api_service.dart';

class CarRepository{
  CarRepository({required ApiService apiservic}){
    _apiservic = apiservic;
  }
  late ApiService _apiservic;


  Future<MyResponse> getAllData()=>_apiservic.getAllCarModelOne();

  Future<MyResponse> getSingleCompany(int id)=>_apiservic.getSingleCompany(id);
}