import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut-large': Icons.donut_large,
  'input': Icons.input,
  'list': Icons.list,
  'slider': Icons.slideshow
};
Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue[500],
  );
}
