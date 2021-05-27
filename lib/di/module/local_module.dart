import 'package:work_app/data/local/constants/db_constants.dart';
import 'package:work_app/data/local/datasources/work/work_datasource.dart';
import 'package:work_app/data/network/apis/work/work_api.dart';
import 'package:work_app/data/repository.dart';
import 'package:work_app/data/sharedpref/shared_preference_helper.dart';
import 'package:work_app/utils/encryption/xxtea.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class LocalModule {
  /// A singleton repository provider.
  ///
  /// Calling it multiple times will return the same instance.
  @factoryMethod
  Repository provideRepository(
      WorkApi postApi,
      SharedPreferenceHelper sharedPreferenceHelper,
      WorkDataSource postDataSource) {
    return Repository(postApi, sharedPreferenceHelper, postDataSource);
  }

  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  @preResolve
  Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  /// A singleton database provider.
  ///
  /// Calling it multiple times will return the same instance.
  @preResolve
  Future<Database> provideDatabase() async {
    // Key for encryption
    var encryptionKey = "";

    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();

    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

    // Check to see if encryption is set, then provide codec
    // else init normal db with path
    var database;
    if (encryptionKey.isNotEmpty) {
      // Initialize the encryption codec with a user password
      var codec = getXXTeaCodec(password: encryptionKey);
      database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);
    } else {
      database = await databaseFactoryIo.openDatabase(dbPath);
    }

    // Return database instance
    return database;
  }
}
