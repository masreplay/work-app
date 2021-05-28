import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;


  LogoWidget({this.width = 300, this.height= 300});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/ic_appicon.png",
      width: 300,
      height: 300,
    );
  }
}

const _opacity =0.7;
class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint0Stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.5078125,size.height*0.5078125),size.width*0.1601563,paint0Stroke);

    Paint paint1Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint1Stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.4472656,size.height*0.4785156),size.width*0.01562500,paint1Stroke);

    var paint2Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint2Stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.3476563,size.height*0.4882813),size.width*0.01562500,paint2Stroke);

    Paint paint3Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint3Stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.4199219,size.height*0.3750000),size.width*0.01562500,paint3Stroke);

    Paint paint_4_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_4_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.6347656,size.height*0.4121094),size.width*0.01562500,paint_4_stroke);

    Paint paint_5_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_5_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.5976563,size.height*0.6386719),size.width*0.01562500,paint_5_stroke);

    Paint paint_6_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_6_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.4160156,size.height*0.6386719),size.width*0.01562500,paint_6_stroke);

    Paint paint_7_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_7_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.5078125,size.height*0.4121094),size.width*0.01562500,paint_7_stroke);

    Paint paint_8_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_8_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.5878906,size.height*0.5195313),size.width*0.01562500,paint_8_stroke);

    Paint paint_9_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_9_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.5957031,size.height*0.3750000),size.width*0.01562500,paint_9_stroke);

    Path path_10 = Path();
    path_10.moveTo(size.width*0.5960937,size.height*0.5062500);
    path_10.cubicTo(size.width*0.6113281,size.height*0.4830078,size.width*0.6230469,size.height*0.4564453,size.width*0.6285156,size.height*0.4263672);

    Paint paint_10_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_10_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_10,paint_10_stroke);

    Path path_11 = Path();
    path_11.moveTo(size.width*0.4314453,size.height*0.6357422);
    path_11.cubicTo(size.width*0.4314453,size.height*0.6357422,size.width*0.5183594,size.height*0.6021484,size.width*0.5777344,size.height*0.5310547);

    Paint paint_11_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_11_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_11,paint_11_stroke);

    Path path_12 = Path();
    path_12.moveTo(size.width*0.5808594,size.height*0.5054688);
    path_12.cubicTo(size.width*0.5603516,size.height*0.4533203,size.width*0.5187500,size.height*0.3992188,size.width*0.4347656,size.height*0.3796875);

    Paint paint_12_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_12_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_12,paint_12_stroke);

    Path path_13 = Path();
    path_13.moveTo(size.width*0.6000000,size.height*0.6232422);
    path_13.cubicTo(size.width*0.6000000,size.height*0.6232422,size.width*0.6031250,size.height*0.5832031,size.width*0.5904297,size.height*0.5351563);

    Paint paint13Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint13Stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_13,paint13Stroke);

    Path path_14 = Path();
    path_14.moveTo(size.width*0.4390625,size.height*0.4917969);
    path_14.cubicTo(size.width*0.4218750,size.height*0.5257812,size.width*0.4117188,size.height*0.5687500,size.width*0.4160156,size.height*0.6230469);

    Paint paint_14_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_14_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_14,paint_14_stroke);

    Path path_15 = Path();
    path_15.moveTo(size.width*0.5800781,size.height*0.3750000);
    path_15.cubicTo(size.width*0.5800781,size.height*0.3750000,size.width*0.5039063,size.height*0.3957031,size.width*0.4550781,size.height*0.4650391);

    Paint paint_15_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_15_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_15,paint_15_stroke);

    Path path_16 = Path();
    path_16.moveTo(size.width*0.6021484,size.height*0.5261719);
    path_16.cubicTo(size.width*0.6201172,size.height*0.5382812,size.width*0.6378906,size.height*0.5531250,size.width*0.6550781,size.height*0.5712891);

    Paint paint_16_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_16_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_16,paint_16_stroke);

    Path path_17 = Path();
    path_17.moveTo(size.width*0.3626953,size.height*0.4839844);
    path_17.cubicTo(size.width*0.3626953,size.height*0.4839844,size.width*0.4677734,size.height*0.4529297,size.width*0.5755859,size.height*0.5101562);

    Paint paint_17_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_17_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_17,paint_17_stroke);

    Paint paint_18_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_18_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.8195313,size.height*0.5884766),size.width*0.02285156,paint_18_stroke);

    Paint paint_19_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_19_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.2080078,size.height*0.5195313),size.width*0.02285156,paint_19_stroke);

    Paint paint_20_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_20_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.1732422,size.height*0.2591797),size.width*0.03281250,paint_20_stroke);

    Paint paint_21_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_21_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.8470703,size.height*0.3476563),size.width*0.03281250,paint_21_stroke);

    Paint paint_22_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_22_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.2992187,size.height*0.8119141),size.width*0.03281250,paint_22_stroke);

    Paint paint_23_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_23_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawCircle(Offset(size.width*0.5363281,size.height*0.1812500),size.width*0.02089844,paint_23_stroke);

    Path path_24 = Path();
    path_24.moveTo(size.width*0.6228516,size.height*0.9492188);
    path_24.lineTo(size.width*0.6138672,size.height*0.8724609);
    path_24.lineTo(size.width*0.5529297,size.height*0.9214844);
    path_24.close();

    Paint paint_24_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_24_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_24,paint_24_stroke);

    Path path_25 = Path();
    path_25.moveTo(size.width*0.1169922,size.height*0.5169922);
    path_25.lineTo(size.width*0.1080078,size.height*0.4400391);
    path_25.lineTo(size.width*0.04726562,size.height*0.4892578);
    path_25.close();

    Paint paint_25_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_25_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_25,paint_25_stroke);

    Path path_26 = Path();
    path_26.moveTo(size.width*0.3974609,size.height*0.1431641);
    path_26.lineTo(size.width*0.3886719,size.height*0.06640625);
    path_26.lineTo(size.width*0.3277344,size.height*0.1154297);
    path_26.close();

    Paint paint_26_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_26_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawPath(path_26,paint_26_stroke);

    Paint paint_27_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_27_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawLine(Offset(size.width*0.6763672,size.height*0.09941406),Offset(size.width*0.7302734,size.height*0.1552734),paint_27_stroke);

    Paint paint_28_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_28_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawLine(Offset(size.width*0.7425781,size.height*0.7560547),Offset(size.width*0.7964844,size.height*0.8119141),paint_28_stroke);

    Paint paint_29_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.007812500;
    paint_29_stroke.color=Color(0xffFFFFFF).withOpacity(_opacity);
    canvas.drawLine(Offset(size.width*0.1134766,size.height*0.7089844),Offset(size.width*0.1673828,size.height*0.7648438),paint_29_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
