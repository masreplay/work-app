import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:work_app/constants/colors.dart';
import 'package:work_app/models/mywork/list_my_work.dart';
import 'package:work_app/ui/splash/splash.dart';
import 'package:work_app/utils/locale/app_localization.dart';
import 'package:work_app/utils/routes/routes.dart';

const _cornerRadius = 18.0;
const _textStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

class WorkItem extends StatelessWidget {
  const WorkItem({
    Key? key,
    required this.work,
  }) : super(key: key);

  final Work work;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocal = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        elevation: 1,
        color: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cornerRadius),
        ),
        child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(_cornerRadius)),
            splashColor: Color(0xff69a1ff),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.singleItem,arguments: work.employee?.first.username);
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0XFFEAEAEA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_cornerRadius),
                      topRight: Radius.circular(_cornerRadius),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLocal.translate("employee_name") +
                            work.employee!.first.username,
                        style: _textStyle.copyWith(color: Colors.black),
                      ),
                      Text(
                        work.employee!.first.createdAt.changeFormat(),
                        style: _textStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Text(
                  appLocal.translate("agent_name") +
                      (work.employee!.first.managerName ??
                          appLocal.translate("un_known")),
                  style: _textStyle,
                ),
              ),
                  SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Text(
                  appLocal.translate("agent_phone_number") +
                      (work.employee!.first.phone),
                  style: _textStyle,
                ),
              ),
                  SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15),
                child: Text(
                  appLocal.translate("location") +
                      (work.repeaters?.city ?? appLocal.translate("un_known")),
                  style: _textStyle,
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.white,
                thickness: 2,
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          appLocal.translate("work_type") + work.workDetails,
                          style: _textStyle,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        ButtonTextWidget(
                          borderRadius: 25,
                          icon: Icon(
                            Icons.navigate_before,
                            color: Colors.red,
                          ),
                          padding: EdgeInsets.zero,
                          onTap: () {},
                        ),
                        SizedBox(width: 10),
                        ButtonTextWidget(
                          borderRadius: 25,
                          icon: Icon(
                            Icons.navigate_next,
                            color: Colors.green,
                          ),
                          padding:
                              EdgeInsets.zero,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ])),
      ),
    );
  }
}

/// date pattern
const String baseDP2 = "yyyy-MM-dd";
const String baseDP = "hh:mm";

extension date on DateTime {
  changeFormat({String pattern = baseDP}) {
    final DateFormat formatter = DateFormat(pattern);
    final String formatted = formatter.format(this);
    return formatted;
  }
}


