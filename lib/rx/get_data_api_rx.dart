import 'dart:async';
import 'package:rx_getx_example/data/models/car_model.dart';
import 'package:rx_getx_example/data/models/my_response.dart';
import 'package:rx_getx_example/data/repositoreis/car_repositories.dart';
import 'package:rxdart/rxdart.dart';

class RxApiFetch {
  RxApiFetch({required this.carRepository}){
    fetchAllData();
  }
  final  CarRepository carRepository;
  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _integerController = PublishSubject<int>();
  final _carModelOneController = PublishSubject<CarModelOne>();


  Stream<int> get getIntegers => _integerController.stream;

  Stream<String> get userNameStream => _userNameController.stream;

  Stream<String> get passwordStream => _passwordController.stream;

  Stream<CarModelOne> get carModelOneStream => _carModelOneController.stream;

  int k = 0;

  void increment() {
    k++;
    _integerController.sink.add(k);
  }


  void decrement() {
    k--;
    _integerController.sink.add(k);
  }


  void clearStreams() {
    updateUserName('');
    updatePassword('');
  }

  void updateUserName(String userName) {
    if (userName.length < 4) {
      _userNameController.sink
          .addError("Please enter at least 4 characters of your name here");
    } else {
      _userNameController.sink.add(userName);
    }
  }

  void updatePassword(String password) {
    if (password.length < 4) {
      _passwordController.sink
          .addError("Please enter at least 4 character of the password here");
    } else {
      _passwordController.sink.add(password);
    }
  }

  fetchAllData() async {
      MyResponse myResponse = await carRepository.getAllData();
    if(myResponse.error.isEmpty){
      _carModelOneController.sink.add(myResponse.data);
    }else{
      _carModelOneController.sink.addError(myResponse.error);
    }
  }

  Stream<bool> get validateForm => Rx.combineLatest2(
    userNameStream,
    passwordStream,
        (a, b) => true,
  );
}