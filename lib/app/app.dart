import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: const Text('home'),
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   static const Map<String, Widget> _tileTitles = {
//     'Animations': Animations(),
//     'Animated Clock': AnimatedClock(),
//     'Render Object Playground': RenderObjectPlayground(),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Flutter UI Challenges',
//         ),
//       ),
//       body: const ListScreen(
//         tileTitles: _tileTitles,
//       ),
//     );
//   }
// }
