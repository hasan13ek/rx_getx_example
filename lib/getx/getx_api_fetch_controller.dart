import 'package:get/get.dart';
import 'package:rx_getx_example/data/models/car_model.dart';
import 'package:rx_getx_example/data/models/my_response.dart';
import 'package:rx_getx_example/data/repositoreis/car_repositories.dart';

class OneApiFetchController extends GetxController {

  OneApiFetchController({required this.carRepository}){
    fetchAllData();
  }
  final CarRepository carRepository;

  final RxInt count = 0.obs;

  final RxBool isLoading = false.obs;

   CarModelOne? cars;

  final RxString error = ''.obs;


  fetchAllData() async {
    showLoader();
    MyResponse myResponse = await carRepository.getAllData();
    if(myResponse.error.isEmpty){
      print('MY RESPONSE DATA  ${myResponse.data}');
      cars = await myResponse.data ;
      hideLoader();
    }else{
      error.value = myResponse.error;
    }
  }

  increment() => count.value++;

  decrement() => count.value--;

  showLoader() {
    isLoading.value = true;
  }

  hideLoader() {
    isLoading.value = false;
  }
}
