import 'package:flutter/material.dart';

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
        height: 260,
        width: MediaQuery.of(context).size.width,
        child:
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardHeader(),
              SizedBox(height: 8),
              Text(
                'Jahting Klub "Kej"',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF001B2E),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Ušće bb, Beograd',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF445979),
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              CardFooter(),
              SizedBox(height: 10),
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Text(
                    'website donatora',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF445979),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Image(image: AssetImage('assets/icons/open_in_new.png')),
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
}

class CardFooter extends StatelessWidget {
  const CardFooter({
  super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(image: AssetImage('assets/icons/check.png')),
            SizedBox(width: 8),
            Text(
              'Besplatno krstarenje rekom',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF445979),
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        Image(image: AssetImage('assets/icons/share.png')),
      ],
    );
  }
}
