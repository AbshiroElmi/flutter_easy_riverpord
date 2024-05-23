import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
  ProviderScope(child: RiverpodApp())
);

final fruitNameProvider = StateProvider<String>((ref) => 'unknown');

class RiverpodApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruitName = ref.watch(fruitNameProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Riverpod App - $fruitName'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FruitButton(fruit: "Banana"),
              FruitButton(fruit: "Apple"),
              FruitButton(fruit: "Orange"),
              FruitButton(fruit: "Grapes"),
            ],
          ),
        ),
      ),
    );
  }
}

class FruitButton extends ConsumerWidget {
  final String fruit;

  FruitButton({required this.fruit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: Text(fruit),
      onPressed: () {
        ref.read(fruitNameProvider.notifier).state = fruit;
      },
    );
  }
}
