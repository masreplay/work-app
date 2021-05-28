import 'package:flutter/material.dart';
import 'package:work_app/utils/device/device_utils.dart';
import 'package:work_app/utils/routes/routes.dart';
import 'package:work_app/widgets/logo_widget.dart';

const double _padding = 20.0;

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
            CustomPaint(
              size: Size(DeviceUtils.getScaledWidth(context, 0.8),
                  DeviceUtils.getScaledWidth(context, 0.8).toDouble()),
              painter: LogoPainter(),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                //TODO separate children in deference widget
                SizedBox(width: _padding),
                Expanded(
                    child: ButtonTextWidget(
                  padding: EdgeInsets.zero,
                  label: 'login',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.login);
                  },
                )),
                SizedBox(width: _padding),
                Expanded(
                    child: ButtonTextWidget(
                      padding: EdgeInsets.zero,
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
                    ?.copyWith(color: Color(0xFFFFFFFF).withOpacity(0.75))),
            SizedBox(height: 25),

            CustomPaint(
              size: Size(100, (100*1).toDouble()),
              painter: RPSCustomPainter(),
            ),
            SizedBox(height: 25),
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
  final Widget? icon;
  final EdgeInsetsGeometry? padding;

  ButtonTextWidget({
    this.label = "",
    this.padding,
    this.borderRadius,
    required this.onTap,
    this.icon,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? SizedBox.shrink(),
              Text(
                label,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w600, color: Color(0xFF2F3238)),
              ),
            ],
          ),
        ));
  }
}




class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.09765625;
    paint_0_stroke.color=Color(0xffFFFFFF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5,size.height*0.5),size.width*0.1501953,paint_0_stroke);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.04882813;
    paint_1_stroke.color=Color(0xffFFFFFF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width*0.5,size.height*0.5),size.width*0.3207031,paint_1_stroke);

    Paint paint_2_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.03906250;
    paint_2_stroke.color=Color(0xffFFFFFF).withOpacity(1.0);
    paint_2_stroke.strokeCap = StrokeCap.round;
    canvas.drawCircle(Offset(size.width*0.5,size.height*0.5),size.width*0.4640625,paint_2_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}