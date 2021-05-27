import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:work_app/data/repository.dart';
import 'package:work_app/models/login/login_response.dart';
import 'package:work_app/stores/error/error_store.dart';

part 'form_store.g.dart';

@Injectable()
class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // repository instance
  late Repository _repository;

  _FormStore(Repository repository) : this._repository = repository {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userName, validateUser),
      reaction((_) => password, validatePassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userName = '';

  @observable
  String password = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userName.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userName.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userName.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userName = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void validateUser(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @observable
  LoginResponse? responseLogin;

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<LoginResponse?> emptyLoginResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<LoginResponse?> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  @action
  Future login() async {
    loading = true;

    final future = _repository.login(userName, password);
    loginFuture = ObservableFuture(future);

    await future.then((value) async {
      _repository.saveIsLoggedIn(true);
      _repository.saveUser(value.message.userData);
      _repository.saveAuthToken(value.message.token);
      responseLogin = value;

      this.loading = false;
      this.success = true;
    }).catchError((e) {
      print(e);
      this.loading = false;
      this.success = false;
      throw e;
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUser(userName);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
