import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:work_app/data/repository.dart';
import 'package:work_app/models/login/login_response.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/stores/error/error_store.dart';

part 'work_store.g.dart';

@Injectable()
class WorkStore = _WorkStore with _$WorkStore;

abstract class _WorkStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _WorkStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<ListMyWork?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ListMyWork?> fetchWorksFuture =
      ObservableFuture<ListMyWork?>(emptyPostResponse);

  @observable
  List<Work> workList = ObservableList<Work>();

  // get user form pref
  @observable
  UserData? user;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchWorksFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getWorks(int skip) async {
    final future = _repository.getWorks(skip: skip);

    await future.then((workList) {
      this.workList = workList.items.first.works;
    });
  }

  @action
  Future logout() async {
    user = null;
    _repository.removeUser();
    _repository.removeIsLoggedIn();
    user = await _repository.user;
    debugPrint(user.toString());
  }
}
