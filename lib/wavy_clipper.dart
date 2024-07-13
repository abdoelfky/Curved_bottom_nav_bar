import 'package:flutter/material.dart';

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // بدء المسار من الزاوية العلوية اليسرى
    path.lineTo(0, size.height / 2);

    // رسم نصف منحنى بيزيه معكوس يتوسط العنصر
    path.quadraticBezierTo(
        size.width / 2, size.height / 2 + size.height / 4,  // نقطة التحكم أقل ارتفاعًا
        size.width, size.height / 2  // نهاية المنحنى
    );

    // إكمال رسم المسار حول العنصر
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
