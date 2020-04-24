
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store{
  
  
  @observable
  bool busy = false; 

}
