import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/ui/home/work_item.dart';

class WorkListItem extends StatelessWidget {
  const WorkListItem({
    required this.work,
    Key? key,
  }) : super(key: key);

  final Work work;

  @override
  Widget build(BuildContext context) => WorkItem(work: work);
}
