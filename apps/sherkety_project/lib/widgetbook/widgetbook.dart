import 'package:flutter/material.dart';
import 'package:sherkety/widgetbook/widgetbook.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetBook());
}
@widgetbook.App()
class WidgetBook extends StatelessWidget {
  const WidgetBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
    );
  }
}