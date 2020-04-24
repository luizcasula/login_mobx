import 'package:login_mobx/models/user_model.dart';
import 'package:login_mobx/repositories/account_repository.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  AccountRepository repository;

  _AppController() {
    repository = AccountRepository();
    busy = false;
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "";

  @observable
  String token = "";

  @observable
  bool busy;

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
