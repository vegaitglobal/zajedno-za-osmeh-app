import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Positioned(
                    top: 55,
                    child: Container(
                      width: 166,
                      height: 12,
                      color: AppColors.blueHighlight,
                    ),
                  ),
                  const Text(
                    'Male stvari donose\nveliku radost.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Positioned(
                    top: 55,
                    left: 146,
                    child: Container(
                      width: 166,
                      height: 12,
                      color: AppColors.blueHighlight,
                    ),
                  ),
                  const Text(
                    'Hajde da činimo velike\nstvari kroz male doprinose.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Najnovije usluge',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: carouselData
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CarouselCard(data: e),
                          ))
                      .toList(),
                ),
              ),
            ),
            // TextButton(
            //     onPressed: () => context.go("/benefits"),
            //     child: const Text("Benefits")),
            // TextButton(
            //     onPressed: () => context.go("/benefits/123"),
            //     child: const Text("Benefit 123")),
            TextButton(
                onPressed: () => context.go("/aboutUs"),
                child: const Text("About us")),

      ]))
    );
  }
}
