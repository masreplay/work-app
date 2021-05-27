import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/utils/routes/routes.dart';

class WorkListItem extends StatelessWidget {
  const WorkListItem({
    required this.work,
    Key? key,
  }) : super(key: key);

  final Work work;

  @override
  Widget build(BuildContext context) => Card(
    elevation: 1,
        child: InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(Routes.singleItem);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              children: [
                Visibility(
                    visible: work.img == null,
                    child: CircleAvatar(
                        radius: 20,
                        child: CachedNetworkImage(imageUrl: work.img ?? ""))),
                SizedBox(width: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: work.employee!.length,
                    itemBuilder: (BuildContext context, int index) => Text(
                        work.employee == null
                            ? "شسي"
                            : work.employee!.elementAt(index).username),
                  ),
                ),
              ],
          ),
            ),
        ),
      );
}
