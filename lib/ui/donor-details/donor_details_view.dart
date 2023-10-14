import 'package:flutter/material.dart';

class DonorDetails extends StatelessWidget {
  const DonorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SREDI APP BAR <3 '),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset('assets/images/graphics/home_graphic_3.png', fit: BoxFit.fill,),
              ),
              Positioned(
                top: 100,
                child: Container(

                  width: 200,


                  decoration: const BoxDecoration(
                  shape: BoxShape.circle,

                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset('assets/images/graphics/home_graphic_2.png', fit: BoxFit.cover,),
                )
              )
            ],
          ),

          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                 Text('Ime Kompanije', style: TextStyle(fontSize: 25),),
                 SizedBox(height: 20,),
                 Text('Adresa', style: TextStyle(fontSize: 25),),
                 SizedBox(height: 20,),
                 Text('Grad', style: TextStyle(fontSize: 25),),
               ]
            )
         )
          ]
         )

      );
  }
}
