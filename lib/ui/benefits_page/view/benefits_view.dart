import 'package:flutter/material.dart';
import 'benefit_card.dart';

class BenefitsView extends StatelessWidget {
  const BenefitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      appBar: AppBar(backgroundColor: Colors.orange),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          child: Column(
            children: [
              const Text(
                'Besplatne ili povlašćene usluge',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF01295F),
                  fontFamily: 'Poppins',
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Filtriraj',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      )),
                  SizedBox(width: 8),
                  Image(image: AssetImage('assets/icons/filter.png')),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 214,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const BenefitCard();
                    }
                ),
              )
    ]
        ),
      ),
    ));
  }
}
