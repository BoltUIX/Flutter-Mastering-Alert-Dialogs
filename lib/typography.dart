import 'package:flutter/cupertino.dart';

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
     // padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(1.0),
      child: Text(name, style: style.copyWith(letterSpacing: 1.0)),
    );
  }
}
