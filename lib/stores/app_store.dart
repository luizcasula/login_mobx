import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
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
  void clear() {
    name = "";
    email = "";
    token = "";
    picture = "";
  }
}
