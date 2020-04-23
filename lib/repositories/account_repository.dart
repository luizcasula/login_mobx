import 'package:login_mobx/models/user_model.dart';
import 'package:login_mobx/view-models/signup_viewmodel.dart';


class AccountRepository{
  
   Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(new Duration(milliseconds: 2000));
    return UserModel(
      id: "1",
      name: "Luiz Casula",
      email: "luizcasulaf@gmail",
      picture: "https://picsum.photos/200/200",
      role: "student",
      token: "xpto",
    );
  }
}