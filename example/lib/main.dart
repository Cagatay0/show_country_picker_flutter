import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:show_country_picker_flutter/country_model.dart';
import 'package:show_country_picker_flutter/show_country_picker_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: openCountryWidget(),
      ),
    );
  }

  Widget openCountryWidget() {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowCountryPickerFlutter(
            textEditingController: textEditingController,
            focusNode: focusNode,
            onTap: (Map<String, dynamic> countryDetail) =>
                log(countryDetail.toString()),
            // isDisplayDialCode: true,
          );
        },
      ),
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Open Country List",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
