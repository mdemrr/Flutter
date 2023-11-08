import 'package:riverpod/riverpod.dart';
import 'package:riverpodexample/model/user_model.dart';
import 'package:riverpodexample/services/service_typicode.dart';

class HomePageController {
  static final HomePageController instance = HomePageController._();
  HomePageController._();
  factory HomePageController() {
    return instance;
  }

  List<UserModel> users = [];

  var usersProvider = FutureProvider<List<UserModel>>((ref) async {
    return await HomePageController().getUser();
  });
  Future<List<UserModel>> getUser() async {
    var user = await ServiceTypicode().fetch();
    return user;
  }
}
