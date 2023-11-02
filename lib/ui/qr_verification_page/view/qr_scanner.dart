import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';
import 'package:gu_mobile/ui/qr_verification_page/bloc/qr_verification_event.dart';
import 'package:gu_mobile/ui/qr_verification_page/bloc/qr_verification_state.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../bloc/qr_verification_bloc.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocListener<QRVerificationBloc, QRVerificationState>(
          listener: (BuildContext context, QRVerificationState state) {
            if (state is QRVerificationSuccessState){
              context.go('${AppRoutes.qrResult.path()}?isValid=${state.qrStatus.isValid.toString()}');
            }
            else if (state is QRVerificationFailureState){
              context.go('${AppRoutes.qrResult.path()}?isValid=false');
            }
          },
          child: _buildQrView(context)),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      String code = scanData.code ?? '';
      context
          .read<QRVerificationBloc>()
          .add(QRVerificatioFetchQRStatus(doneeId: code));
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
