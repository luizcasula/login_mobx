import 'package:login_mobx/controllers/signup_controller.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  
  SignupController signup;
  
  _AppController() {
    signup = SignupController();
  }
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "";

  @observable
  String token = "";

  @action
  void setUser(String _name, String _email, String _picture, String _token) {
    name = _name;
    email = _email;
    token = _token;
    picture = _picture;
  }

  @action
  getUser() {}
}
