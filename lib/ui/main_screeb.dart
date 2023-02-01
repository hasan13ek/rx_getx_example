import 'package:flutter/material.dart';
import 'package:rx_getx_example/ui/getx_ui.dart';
import 'package:rx_getx_example/ui/rx_ui.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen "),
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>OneScreen()));
          }, child: const Text('Getx Screen')),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>RxScreen()));
          }, child: const Text('Rx Screen')),
        ],
      ),
    );
  }
}
