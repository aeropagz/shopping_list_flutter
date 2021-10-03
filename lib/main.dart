import 'package:flutter/material.dart';
import 'package:shopping_list/src/state/lists_provider.dart';
import 'package:shopping_list/src/state/user_provider.dart';
import 'src/views/login.dart';
import 'src/views/home_page.dart';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ListResponseProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(0xff, 0x40, 0xB7, 0xAD),
        focusColor: const Color.fromARGB(0xff, 0xF1, 0xBF, 0x5F),
        bottomAppBarColor: Colors.black,
        backgroundColor: Colors.white,
        textTheme: const TextTheme(
          button: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        'home': (context) => const HomePage(),
        'login': (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
