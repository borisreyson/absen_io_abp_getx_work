import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Color topPrimary;
  final Color topSecondary;
  final Color bottomPrimary;
  final Color bottomSecondary;
  final Color bgColor;
  const Background(
      {required this.topPrimary,
      required this.topSecondary,
      required this.bottomPrimary,
      required this.bottomSecondary,
      required this.bgColor,
      Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<Background> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        color: widget.bgColor,
        child: CustomPaint(
          size: Size(size.width, size.height),
          painter: Curved(widget.topPrimary, widget.topPrimary,
              widget.bottomPrimary, widget.bottomPrimary),
        ),
      ),
    );
  }
}

class Curved extends CustomPainter {
  Color topPrimary;
  Color topSecondary;
  Color bottomPrimary;
  Color bottomSecondary;
  Curved(
    this.topPrimary,
    this.topSecondary,
    this.bottomPrimary,
    this.bottomSecondary,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    // Path rectPathThree = Path();
    Paint paint = Paint();
    paint.shader = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [.01, .215],
      colors: [
        topSecondary,
        topPrimary,
      ],
    ).createShader(rect);

    Paint paint2 = Paint();
    paint2.shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: const [.05, 1],
      colors: [
        bottomSecondary,
        bottomPrimary,
      ],
    ).createShader(rect);

    Paint paint3 = Paint();
    paint3.shader = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [.05, 1],
      colors: [
        Color(0xff7862A3),
        Color(0xff574194),
      ],
    ).createShader(rect);

    var path = Path();
    var path2 = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width * 0.6,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.1,
      size.width * 0.1,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.06,
      size.height * 0.4,
      size.width * 0,
      size.height * 0.4,
    );
    path.close();
    //
    path2.moveTo(size.width, size.height);
    path2.lineTo(size.width, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width,
      size.height * .65,
      size.width,
      size.height * 0.7,
    );
    path2.quadraticBezierTo(
      size.width * .9,
      size.height * .95,
      size.width * 0.2,
      size.height * 0.97,
    );
    path2.quadraticBezierTo(
      size.width * .1,
      size.height * .98,
      size.width * 0.1,
      size.height,
    );
    path2.close();
    //

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// FOR PAINTING THE CIRCLE
class CirclePainter extends CustomPainter {
  final double radius;
  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
