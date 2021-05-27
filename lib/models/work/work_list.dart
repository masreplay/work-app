import 'package:work_app/models/mywork/list_my_work.dart';

class WorkList {
  final List<Work>? works;

  WorkList({
    this.works,
  });

  factory WorkList.fromJson(List<dynamic> json) {
    List<Work> works = <Work>[];
    works = json.map((work) => Work.fromJson(work)).toList();

    return WorkList(
      works: works,
    );
  }
}
