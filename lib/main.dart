import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatestquestion/screens/first_screen.dart';
import 'package:suitmediatestquestion/screens/global_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GlobalViewModel(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
