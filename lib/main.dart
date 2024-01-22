import 'package:flutter/material.dart';
import 'package:flutter_singleton_streambuilder/pages/pagina1_page.dart';
import 'package:flutter_singleton_streambuilder/pages/pagina2_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': ( _ ) => const Pagina1Page(),
        'pagina2': ( _ ) => const Pagina2Page(),
      },
    );
  }
}
