import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'dart:math' show pi;

class KiblatWidget extends StatelessWidget {
  final _kompas = SvgPicture.asset('assets/compass.svg');
  final _jarum = SvgPicture.asset(
    'assets/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: ((_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }

        final qiblahDirection = snapshot.data;

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: ((qiblahDirection?.direction ?? 0) * (pi / 180) * -1),
              child: _kompas,
            ),
            Transform.rotate(
              angle: ((qiblahDirection?.qiblah ?? 0) * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _jarum,
            ),
          ],
        );
      }),
    );
  }
}
