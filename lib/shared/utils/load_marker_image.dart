


import 'dart:ui' as ui;

import 'package:flutter/services.dart';

Future<Uint8List> getBytesFromAsset(String path, double width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width.toInt());
  ui.FrameInfo fi = await codec.getNextFrame();
  return  (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}