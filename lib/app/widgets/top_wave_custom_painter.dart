import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

Widget TopWavesCustomPainter() {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 190,
          child: CustomPaint(
            painter: SecondWave(),
            child: Container(),
          ),
        ),
      ),
      SizedBox(
        height: 145,
        child: CustomPaint(
          painter: FirstWave(),
          child: Container(),
        ),
      ),
    ],
  );
}

//Copy this CustomPainter code to the Bottom of the File
class FirstWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.2919708, size.height * -0.2346570);
    path_0.cubicTo(
        size.width * -0.2919708,
        size.height * -0.2486137,
        size.width * -0.2843455,
        size.height * -0.2599278,
        size.width * -0.2749392,
        size.height * -0.2599278);
    path_0.lineTo(size.width * 1.060827, size.height * -0.2599278);
    path_0.cubicTo(
        size.width * 1.070234,
        size.height * -0.2599278,
        size.width * 1.077859,
        size.height * -0.2486137,
        size.width * 1.077859,
        size.height * -0.2346570);
    path_0.lineTo(size.width * 1.077859, size.height * 0.8486209);
    path_0.cubicTo(
        size.width * 1.077859,
        size.height * 0.8627798,
        size.width * 1.064455,
        size.height * 0.8659134,
        size.width * 1.061521,
        size.height * 0.8524404);
    path_0.cubicTo(
        size.width * 0.9902530,
        size.height * 0.5251769,
        size.width * 0.7228589,
        size.height * 0.3996715,
        size.width * 0.5377056,
        size.height * 0.6065812);
    path_0.lineTo(size.width * 0.3408321, size.height * 0.8265921);
    path_0.cubicTo(
        size.width * 0.1605990,
        size.height * 1.006007,
        size.width * -0.06636813,
        size.height * 1.047668,
        size.width * -0.2706326,
        size.height * 0.9388339);
    path_0.lineTo(size.width * -0.2907299, size.height * 0.9281264);
    path_0.cubicTo(
        size.width * -0.2914745,
        size.height * 0.9277292,
        size.width * -0.2919708,
        size.height * 0.9266823,
        size.width * -0.2919708,
        size.height * 0.9255054);
    path_0.lineTo(size.width * -0.2919708, size.height * -0.2346570);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.8819951, size.height * 0.2003610),
        Offset(size.width * 0.01824822, size.height * 0.9602888), [
      Color(0xff0081C9).withOpacity(1),
      Color(0xff0059AA).withOpacity(1),
      Color(0xff0059AA).withOpacity(1)
    ], [
      0,
      1,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class SecondWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1084397, size.height * -0.2212224);
    path_0.cubicTo(
        size.width * 0.1131428,
        size.height * -0.2278130,
        size.width * 0.1235591,
        size.height * -0.2300709,
        size.width * 0.1317051,
        size.height * -0.2262657);
    path_0.lineTo(size.width * 1.438978, size.height * 0.3843720);
    path_0.cubicTo(
        size.width * 1.447124,
        size.height * 0.3881772,
        size.width * 1.449915,
        size.height * 0.3966043,
        size.width * 1.445212,
        size.height * 0.4031949);
    path_0.lineTo(size.width * 1.022754, size.height * 0.9951949);
    path_0.cubicTo(
        size.width * 1.017350,
        size.height * 1.002766,
        size.width * 1.003007,
        size.height * 0.9982559,
        size.width * 1.005345,
        size.height * 0.9897185);
    path_0.cubicTo(
        size.width * 1.062545,
        size.height * 0.7807165,
        size.width * 0.8452895,
        size.height * 0.5894055,
        size.width * 0.5830511,
        size.height * 0.6178563);
    path_0.lineTo(size.width * 0.3120584, size.height * 0.6472559);
    path_0.cubicTo(
        size.width * 0.06703650,
        size.height * 0.6628091,
        size.width * -0.1720966,
        size.height * 0.5812795,
        size.width * -0.3294623,
        size.height * 0.4285394);
    path_0.lineTo(size.width * -0.3437640, size.height * 0.4146575);
    path_0.cubicTo(
        size.width * -0.3443212,
        size.height * 0.4141181,
        size.width * -0.3444015,
        size.height * 0.4133543,
        size.width * -0.3439684,
        size.height * 0.4127461);
    path_0.lineTo(size.width * 0.1084397, size.height * -0.2212224);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 1.047445, size.height * 0.5452756),
        Offset(size.width * 0.4793187, size.height * 0.5629921),
        [Color(0xff61BB46).withOpacity(1), Color(0xff00854A).withOpacity(1)],
        [0.00282221, 1]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
