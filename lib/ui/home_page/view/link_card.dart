import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';

class LinkCard extends StatelessWidget {
  final String image;
  final String title;
  final String buttonText;
  final AppRoutes goTo;
  final CrossAxisAlignment align;

  const LinkCard({
    required this.image,
    required this.title,
    required this.buttonText,
    required this.goTo,
    required this.align,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: align,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go(goTo.path()),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.white, width: 2)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
