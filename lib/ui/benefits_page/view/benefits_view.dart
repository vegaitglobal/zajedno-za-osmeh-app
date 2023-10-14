import 'package:flutter/material.dart';
import '../../../resources/my_colors.dart';
import 'benefit_card.dart';
import '../../filter_page/filter_view';

class BenefitsView extends StatelessWidget {
  const BenefitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F5FA),
        appBar: AppBar(backgroundColor: Colors.orange),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'Besplatne ili povlašćene usluge',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.royalBlue,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterView()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Filtriraj',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.royalBlue,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Image(
                        image:
                            AssetImage('assets/images/icons/filter_icon.png')),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 214,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const BenefitCard();
                    }),
              )
            ]),
          ),
        ));
  }
}
