import 'package:flutter/material.dart';
import 'src/common/constants_library.dart';
import 'src/common/widgets/characters_list_builder.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeRoute(title: StringConstants.appBarTitle),
    );
  }
}

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text(title)),
        ),
        body: const CharactersListBuilder.build(),
      );
}
