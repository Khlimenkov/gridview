import 'package:flutter/material.dart';
import 'package:gridview/features/app/extensions/build_context_x.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: AppBar(
        title: const Text('GridView'),
        leading: context.navigator.canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  context.navigator.pop();
                },
              )
            : null,
      ),
    );
  }
}
