import 'package:flutter/material.dart';
import 'package:rx_getx_example/data/network/api_service.dart';
import 'package:rx_getx_example/data/repositoreis/car_repositories.dart';
import 'package:rx_getx_example/rx/get_data_api_rx.dart';

class RxScreen extends StatefulWidget {
  const RxScreen({Key? key}) : super(key: key);

  @override
  State<RxScreen> createState() => _RxScreenState();
}

class _RxScreenState extends State<RxScreen> {
  RxApiFetch rxApiFetch = RxApiFetch(carRepository: CarRepository(apiservic:ApiService()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rx api Fetch"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder
          (
            stream: rxApiFetch.carModelOneStream,
            builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }else  if(snapshot.hasData){
                  return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: 8,
                    itemBuilder:
                        (BuildContext context, int index) {
                      var list = snapshot.data!.data[index];
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
                  );
                }
              return const SizedBox();
            }
        ),
      ) ,
    );
  }
}
