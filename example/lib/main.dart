import 'package:components_plus/components_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components Package Example',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('Components Demo')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: Components.textFieldDecoration(
                    hintText: 'Enter Text',
                  ),
                ),
                Components.sizedBoxHeight(20),
                ShrinkingButton(
                  text: 'Show Toast',
                  onTap: () {
                    Components.showToast(strMsg: 'Hello from Components!');
                  },
                ),
                Components.sizedBoxHeight(20),
                ShrinkingButton(
                  text: 'Launch URL',
                  onTap: () async {
                    Components.logger('Trying to open URL...');
                    await Components.urlLauncher('https://flutter.dev');
                  },
                ),
                Components.sizedBoxHeight(20),
                ShrinkingButton(
                  text: 'Toggle Loader',
                  onTap: () {
                    setState(() => _isLoading = !_isLoading);
                  },
                  buttonColor: Colors.green,
                ),
                Components.sizedBoxHeight(20),
                ShrinkingButton(
                  text: 'Exit Dialog',
                  onTap: () {
                    Components().showExitDialog(context, title: 'Exit App');
                  },
                  buttonColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
        Components.showLoader(isLoading: _isLoading, context: context),
      ],
    );
  }
}
