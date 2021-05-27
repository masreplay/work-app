import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:work_app/data/local/constants/db_constants.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/models/work/work_list.dart';

@Singleton()
class WorkDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _worksStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Database _db;

  // Constructor
  WorkDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Work work) async {
    return await _worksStore.add(await _db, work.toJson());
  }

  Future<int> count() async {
    return await _worksStore.count(await _db);
  }

  Future<List<Work>> getAllSortedByFilter({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _worksStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Work> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final work = Work.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      work.id = snapshot.key;
      return work;
    }).toList();
  }

  Future<WorkList> getWorksFromDb() async {
    print('Loading from database');

    // work list
    var worksList;

    // fetching data
    final recordSnapshots = await _worksStore.find(
      await _db,
    );

    // Making a List<Work> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      worksList = WorkList(
          works: recordSnapshots.map((snapshot) {
        final work = Work.fromJson(snapshot.value);
        // An ID is a key of a record from the database.
        work.id = snapshot.key;
        return work;
      }).toList());
    }

    return worksList;
  }

  Future<int> update(Work work) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(work.id));
    return await _worksStore.update(
      await _db,
      work.toJson(),
      finder: finder,
    );
  }

  Future<int> delete(Work work) async {
    final finder = Finder(filter: Filter.byKey(work.id));
    return await _worksStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _worksStore.drop(
      await _db,
    );
  }
}
