import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../common/custom_appbar.dart';
import '../../common/custom_bottom_navigation_bar.dart';

class MyQrCodeView extends StatelessWidget {
  const MyQrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), bottomNavigationBar: const CustomBottomNavigationBar(), body: Center(child: QrImageView(
      data: '1', // TODO: Replace with actual value (Donee: id)
      version: QrVersions.auto,
      size: 300,
      embeddedImageStyle: const QrEmbeddedImageStyle(
        size: Size(70, 70),
      ),
    )));
  }

}
