import 'package:login_mobx/models/user_model.dart';
import 'package:login_mobx/repositories/account_repository.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';


class SignupController {
  AccountRepository repository;

  SignupController(){
    repository = AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async{
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }
}
