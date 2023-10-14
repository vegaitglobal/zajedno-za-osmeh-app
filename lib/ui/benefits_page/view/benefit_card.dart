import 'package:flutter/material.dart';

import '../../../resources/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BenefitCard extends StatelessWidget {
  const BenefitCard({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardHeader(),
              const SizedBox(height: 8),
              Text(
                'Jahting Klub "Kej"',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
              Text(
                'Ušće bb, Beograd',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grayBlue
                ),
              ),
              const SizedBox(height: 20),
              const CardFooter(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );

  }
  


}

class CardHeader extends StatelessWidget {
  const CardHeader({
  super.key,
  });

  static const List<String> categories = ['Turizam', 'Zabava', 'Beograd'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Image.network(
                'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                height: 60,
                width: 100,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    'website donatora',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.royalBlue
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(onPressed: () { _launchUrl(Uri.parse('https://flutter.dev'));}, icon:Image(image: AssetImage('assets/images/icons/open_in_new_icon.png'))),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [...categories.map((category) => Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Chip(
              label: Text(category, style: const TextStyle(fontSize: 12, color: Color(0xFF01295F))),
              backgroundColor: const Color(0xFFE8EBF7),
            ),
          ))],
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class CardFooter extends StatelessWidget {
  const CardFooter({
  super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Image.asset('assets/images/icons/check_icon.png'),
              const SizedBox(
                width: 12,
              ),
              Expanded(

                child: Text(
                  'Besplatno krstarenje rekom',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textColor,
                  ),
                ),
              )
            ],
          ),
        ),
        const Image(image: AssetImage('assets/images/icons/share_icon.png')),
      ],
    );
  }
}
