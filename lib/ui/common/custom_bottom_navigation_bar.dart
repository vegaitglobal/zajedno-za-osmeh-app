import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import '../../resources/my_colors.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {


  void goTo(AppRoutes nextRoute) {
    context.go(nextRoute.path());
  }

  bool isActive(AppRoutes route) {
    String currentRouteName = ModalRoute.of(context)!.settings.name ?? '';
    return currentRouteName.startsWith(route.name);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildNavigationItem(AppRoutes.home, 'Home', 'assets/images/icons/home${isActive(AppRoutes.home) ? '_active' : ''}_icon.png'),
            buildNavigationItem(AppRoutes.benefits, 'Usluge', 'assets/images/icons/benefits${isActive(AppRoutes.benefits) ? '_active' : ''}_icon.png')
          ],
        ),
      ),
    );
  }

  Widget buildNavigationItem(AppRoutes route, String name, String iconSrc) {
    return ElevatedButton(
        style: getButtonStyle(),
        onPressed: () => goTo(route),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(iconSrc)),
              Text(name, style: TextStyle(color: isActive(route) ? AppColors.textColor : AppColors.grayBlue))
            ]
        )
    );
  }

  ButtonStyle getButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((_) {return Colors.white;}),
        elevation: MaterialStateProperty.resolveWith<double?>((_) {return 0.0;})
    );
  }

}