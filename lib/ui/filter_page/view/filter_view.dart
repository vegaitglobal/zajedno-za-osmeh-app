import 'package:flutter/material.dart';
import '../../../resources/my_colors.dart';
import 'category_item.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<CategoryItem> selectedCategories = [];
  String? selectedCity;

  List<CategoryItem> categories = [
    CategoryItem('Zdravstvo', Icons.close),
    CategoryItem('Ugostiteljstvo', Icons.close),
    CategoryItem('Kultura', Icons.close),
    CategoryItem('Usluge', Icons.close),
    CategoryItem('Zabava', Icons.close)
  ];
  List<String> cities = ['Novi Sad', 'Beograd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, right: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Zatvori',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Filteri',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Kategorije',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(category.icon),
                      SizedBox(width: 4.0),
                      Text(
                        category.name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  selected: selectedCategories.contains(category),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.transparent,
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Lokacija',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grayBlue, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 12, bottom: 2), 
                child: DropdownButton<String>(
                  isExpanded: true, 
                  value: selectedCity,
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCity = newValue;
                    });
                  },
                  underline: Container(
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (selectedCity != null) {
                  // TODO: Implementiraj
                }
              },
              child: Text(
                'Primeni',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 42),
              ),
            )
          ],
        ),
      ),
    );
  }
}