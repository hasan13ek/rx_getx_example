import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_getx_example/data/network/api_service.dart';
import 'package:rx_getx_example/data/repositoreis/car_repositories.dart';
import 'package:rx_getx_example/getx/getx_api_fetch_controller.dart';
import 'package:rx_getx_example/data/models/car_model.dart';


class OneScreen extends StatefulWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  final OneApiFetchController getxApiFetchController = Get.put(OneApiFetchController(carRepository: CarRepository(apiservic: ApiService())));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Api Fetch"),
      ),
    body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: getxApiFetchController.isLoading==true? const Center(child: CircularProgressIndicator(),):
      GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: 8,
        itemBuilder:
            (BuildContext context, int index) {
            var list = getxApiFetchController.cars!.data[index];
          return GestureDetector(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (builder)=>PageFour(id: state.carModelOne.data[index].id!)));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 4),
              margin: const EdgeInsets.only(top: 6,left: 4,right: 4,bottom: 2),
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                  borderRadius:
                  BorderRadius.circular(12),
                  color: Colors.white),
              child: Column(
                children: [
                  Center(child: Text(list.carModel.toString())),
                  const SizedBox(height: 4,),
                  Container(width: double.infinity,height: 1,color: Colors.grey,),
                  Container(
                    width: double.infinity,
                    height: 143,
                    decoration:  BoxDecoration(
                      borderRadius:const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)
                      ),
                      image: DecorationImage(image:
                      NetworkImage(
                          list.logo.toString()),
                          fit: BoxFit.fill,scale: 6),
                    ),
                  )
                ],),
            ),
          );
        },
      )

    ),
    );
  }
}
