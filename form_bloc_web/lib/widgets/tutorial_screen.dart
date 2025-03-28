import 'package:flutter/material.dart';
import 'package:form_bloc_web/widgets/widgets.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            ...children,
            const ShowAllCodeButton(),
          ],
        ),
      ),
    );
  }
}
