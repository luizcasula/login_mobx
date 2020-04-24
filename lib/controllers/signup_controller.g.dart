// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupController, Store {
  Computed<bool> _$isAllValidComputed;

  @override
  bool get isAllValid =>
      (_$isAllValidComputed ??= Computed<bool>(() => super.isAllValid)).value;

  final _$busyAtom = Atom(name: '_SignupController.busy');

  @override
  bool get busy {
    _$busyAtom.context.enforceReadPolicy(_$busyAtom);
    _$busyAtom.reportObserved();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.context.conditionallyRunInAction(() {
      super.busy = value;
      _$busyAtom.reportChanged();
    }, _$busyAtom, name: '${_$busyAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_SignupController.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_SignupController.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_SignupController.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future<UserModel> create(SignupViewModel model) {
    return _$createAsyncAction.run(() => super.create(model));
  }

  final _$_SignupControllerActionController =
      ActionController(name: '_SignupController');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_SignupControllerActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_SignupControllerActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_SignupControllerActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validatePassword() {
    final _$actionInfo = _$_SignupControllerActionController.startAction();
    try {
      return super.validatePassword();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateEmail() {
    final _$actionInfo = _$_SignupControllerActionController.startAction();
    try {
      return super.validateEmail();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateName() {
    final _$actionInfo = _$_SignupControllerActionController.startAction();
    try {
      return super.validateName();
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'busy: ${busy.toString()},name: ${name.toString()},email: ${email.toString()},password: ${password.toString()},isAllValid: ${isAllValid.toString()}';
    return '{$string}';
  }
}
