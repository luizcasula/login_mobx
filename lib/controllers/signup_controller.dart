import 'package:login_mobx/controllers/app_controller.dart';
import 'package:login_mobx/models/user_model.dart';
import 'package:login_mobx/repositories/account_repository.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  AccountRepository repository;
  AppController app;

  _SignupController() {
    repository = AccountRepository();
    //app = Provider.of<AppController>();
  }

  @action
  Future<UserModel> create(SignupViewModel model) async {
    busy = true;
    var user = await repository.createAccount(model);
    busy = false;
    return user;
  }

  //controll view
  @observable
  bool busy = false;

  //model view
  @observable
  String name;

  @observable
  String email;

  @observable
  String password;


  @action
  changeName(String value) => name = value;

  @action
  changeEmail(String value) => email = value;

  @action
  changePassword(String value) => password = value;


  //validates
  @action
  String validatePassword() {
    if (password.isEmpty) {
      return 'Password invalid';
    }
    return null;
  }
  
  @action
  String validateEmail() {
    if (email.isEmpty) {
      return 'Password invalid';
    }
    return null;
  }
  
  @action
  String validateName() {
    if (name.isEmpty) {
      return 'Password invalid';
    }
    return null;
  }

  @computed
  bool get isAllValid {
    return validateName == null && validatePassword == null && validateEmail == null;
  }
}
