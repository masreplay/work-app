import 'package:flutter/material.dart';
import 'package:work_app/widgets/logo_widget.dart';
import 'package:work_app/utils/routes/routes.dart';

const double _padding = 10.0;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF03B99B),
            Color(0xFF346BB6),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(),
            Row(
              children: [
                //TODO separate children in deference widget
                SizedBox(width: _padding),
                Expanded(
                    child: ButtonTextWidget(
                  label: 'login',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.login);
                  },
                )),
                SizedBox(width: _padding),
                Expanded(
                    child: ButtonTextWidget(
                  label: 'register',
                  onTap: () {},
                )),
                SizedBox(width: _padding),
              ],
            ),
            SizedBox(height: 50),
            Text("Now! Quick login use your touch ID",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white)),
            SizedBox(height: 50),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 50),
            Text("use touch id".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}



class ButtonTextWidget extends StatelessWidget {
  final String label;
  final double? borderRadius;
  final Function onTap;
  final EdgeInsetsGeometry? padding;

  ButtonTextWidget({
    required this.label,
    this.padding,
    this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 50))),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          onTap.call();
        },
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F3238)),
          ),
        ));
  }
}
