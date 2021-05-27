import 'dart:async';

import 'package:sembast/sembast.dart';
import 'package:work_app/models/login/login_response.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/models/work/work_list.dart';

import 'local/constants/db_constants.dart';
import 'local/datasources/work/work_datasource.dart';
import 'network/apis/work/work_api.dart';
import 'sharedpref/shared_preference_helper.dart';

class Repository {
  // data source object
  final WorkDataSource _workDataSource;

  // api objects
  final WorkApi _workApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._workApi, this._sharedPrefsHelper, this._workDataSource);

  // Work: ---------------------------------------------------------------------
  /*Future<ListMyWork> getWorks(int skip) async {
    // check to see if work are present in database, then fetch from database
    // else make a network call to get all work, store them into database for
    // later use
    return await _workApi.getMyWork(skip).then((ListMyWork workList) {
      workList.items.first.works.forEach((work) {
        _workDataSource.insert(work);
      });

      return workList;
    }).catchError((error) => throw error);
  }*/


  Future<ListMyWork> getWorks({int skip = 0, int limit = 10}) async {
    return await _workApi
        .getMyWork( skip)
        .catchError((error) => throw error);
  }



  Future<LoginResponse> login(String username, String password) async {
    return await _workApi
        .login(username, password)
        .catchError((error) => throw error);
  }

  Future<List<Work>> findWorkById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _workDataSource
        .getAllSortedByFilter(filters: filters)
        .then((work) => work)
        .catchError((error) => throw error);
  }

  Future<int> insert(Work work) => _workDataSource
      .insert(work)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Work work) => _workDataSource
      .update(work)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Work work) => _workDataSource
      .update(work)
      .then((id) => id)
      .catchError((error) => throw error);

  // Login:---------------------------------------------------------------------

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<void> saveAuthToken(String value) =>
      _sharedPrefsHelper.saveAuthToken(value);

  Future<void> saveUser(UserData value)  =>  _sharedPrefsHelper.saveUser(value);

  Future<void> getAuthToken(String value) =>
      _sharedPrefsHelper.saveAuthToken(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<UserData?> get user => _sharedPrefsHelper.user;

  Future<Future<bool>> removeIsLoggedIn() async {
    return _sharedPrefsHelper.removeIsLoggedIn();
  }

  Future<Future<bool>> removeUser() async {
    return _sharedPrefsHelper.removeUser();
  }

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
