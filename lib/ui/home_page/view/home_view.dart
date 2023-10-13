import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Center(child: Column(children: [
        TextButton(onPressed: () => context.go("/benefits"),
            child: const Text("Benefits")
        ),
        TextButton(onPressed: () => context.go("/benefits/123"),
            child: const Text("Benefit 123")
        ),
        TextButton(onPressed: () => context.go("/aboutUs"),
            child: const Text("About us")
        ),
      ]))
    );
  }
}
