import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/home_page/view/carousel_card.dart';

import '../../common/custom_bottom_navigation_bar.dart';
import '../model/carousel_item_model.dart';

// Mock carousel data
List<CarouselItem> carouselData = [
  CarouselItem(
    title: 'Poliklinika ST Medicina',
    address: 'Bulevar oslobođenja 79, Novi Sad',
    websiteUrl: 'www.example.com',
    coverImgUrl:
        'https://scontent.fbeg2-1.fna.fbcdn.net/v/t39.30808-6/277811310_462361305606652_7778290834032971142_n.jpg?stp=dst-jpg_s960x960&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=7UBkYfamXH0AX_rOsME&_nc_ht=scontent.fbeg2-1.fna&oh=00_AfBOzEdoAe_uMBOHg3q6viXl7kirBT4f5vR4MEl6GMSHzw&oe=65301498',
    logoImgUrl:
        'https://scontent.fbeg2-1.fna.fbcdn.net/v/t39.30808-1/326391428_1957904057875706_8328896649193486984_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9GusUDnOnQIAX9prQvw&_nc_ht=scontent.fbeg2-1.fna&oh=00_AfCWAQSDf3qaM7yyJw8DmSrZFq3xXfW41PYuKUZLuziOnQ&oe=652EC9A9',
    services: [
      'rtg dijagnostika (snimanje, očitavanje od strane specijaliste radiologije,izveštaj, cd.)',
      'ultrazvučna dijagnostika ( abdomen, štitna žlezda, srce, dojke sa izveštajem lekara specijaliste)',
      'Obuhvaćena starosna dob, od 7. do navršenih 19. godina.'
    ],
    tags: ['Zdravstvo', 'Beograd'],
  ),
  CarouselItem(
    title: 'Poliklinika ST Medicina',
    address: 'Bulevar oslobođenja 79, Novi Sad',
    websiteUrl: 'www.example.com',
    coverImgUrl:
        'https://scontent.fbeg2-1.fna.fbcdn.net/v/t39.30808-6/277811310_462361305606652_7778290834032971142_n.jpg?stp=dst-jpg_s960x960&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=7UBkYfamXH0AX_rOsME&_nc_ht=scontent.fbeg2-1.fna&oh=00_AfBOzEdoAe_uMBOHg3q6viXl7kirBT4f5vR4MEl6GMSHzw&oe=65301498',
    logoImgUrl:
        'https://scontent.fbeg2-1.fna.fbcdn.net/v/t39.30808-1/326391428_1957904057875706_8328896649193486984_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9GusUDnOnQIAX9prQvw&_nc_ht=scontent.fbeg2-1.fna&oh=00_AfCWAQSDf3qaM7yyJw8DmSrZFq3xXfW41PYuKUZLuziOnQ&oe=652EC9A9',
    services: [
      'rtg dijagnostika (snimanje, očitavanje od strane specijaliste radiologije,izveštaj, cd.)',
      'ultrazvučna dijagnostika ( abdomen, štitna žlezda, srce, dojke sa izveštajem lekara specijaliste)',
      'Obuhvaćena starosna dob, od 7. do navršenih 19. godina.'
    ],
    tags: ['Zdravstvo', 'Beograd'],
  ),
  CarouselItem(
    title: 'Poliklinika ST Medicina',
    address: 'Bulevar oslobođenja 79, Novi Sad',
    websiteUrl: 'www.example.com',
    coverImgUrl:
        'https://scontent.fbeg2-1.fna.fbcdn.net/v/t39.30808-6/277811310_462361305606652_7778290834032971142_n.jpg?stp=dst-jpg_s960x960&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=7UBkYfamXH0AX_rOsME&_nc_ht=scontent.fbeg2-1.fna&oh=00_AfBOzEdoAe_uMBOHg3q6viXl7kirBT4f5vR4MEl6GMSHzw&oe=65301498',
    logoImgUrl:
        'https://scontent.fbeg2-1.fna.fbcdn.net/v/t39.30808-1/326391428_1957904057875706_8328896649193486984_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9GusUDnOnQIAX9prQvw&_nc_ht=scontent.fbeg2-1.fna&oh=00_AfCWAQSDf3qaM7yyJw8DmSrZFq3xXfW41PYuKUZLuziOnQ&oe=652EC9A9',
    services: [
      'rtg dijagnostika (snimanje, očitavanje od strane specijaliste radiologije,izveštaj, cd.)',
      'ultrazvučna dijagnostika ( abdomen, štitna žlezda, srce, dojke sa izveštajem lekara specijaliste)',
      'Obuhvaćena starosna dob, od 7. do navršenih 19. godina.'
    ],
    tags: ['Zdravstvo', 'Beograd'],
  )
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
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
            )
            // TextButton(
            //     onPressed: () => context.go("/benefits"),
            //     child: const Text("Benefits")),
            // TextButton(
            //     onPressed: () => context.go("/benefits/123"),
            //     child: const Text("Benefit 123")),
            // TextButton(
            //     onPressed: () => context.go("/aboutUs"),
            //     child: const Text("About us")),
          ],
        ),
      ),
    );
  }
}
