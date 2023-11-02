import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../data/authentication/i_authentication_repository.dart';
import '../../common/custom_appbar.dart';
import '../../common/custom_bottom_navigation_bar.dart';

class MyQrCodeView extends StatelessWidget {
  const MyQrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocConsumer<QrCodeBloc, QrCodeState>(
        listenWhen: (context, state) {
          if (state is ErrorGeneratingUserId) {
            return true;
          } else {
            return false;
          }
        },
        buildWhen: (context, state) {
          if (state is UserIdGenerated || state is QrCodeGenerating) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          if (state is ErrorGeneratingUserId) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Doslo je do greske prilikom generisanja QR koda"),
            ));
          }
        },
        builder: (context, state) {
          return switch (state) {
            QrCodeGenerating() => const CircularProgressIndicator(),
            UserIdGenerated() => _qrContainer(state),
            ErrorGeneratingUserId() => Container(),
          };
        },
      ),
    );
  }

  Widget _qrContainer(UserIdGenerated state) => Center(
        child: QrImageView(
          data: state is UserIdGenerated ? state.userId : "",
          version: QrVersions.auto,
          size: 250,
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(70, 70),
          ),
        ),
      );
}

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  late IAuthenticationRepository repo;

  QrCodeBloc({required IAuthenticationRepository repository})
      : super(QrCodeGenerating()) {
    repo = repository;
    fetchUserId();
  }

  void fetchUserId() async {
    await repo
        .getCurrentUserId()
        .then((value) => {emit(UserIdGenerated(userId: value))})
        .onError((error, stackTrace) => {emit(ErrorGeneratingUserId())});
  }
}

sealed class QrCodeEvent {}

sealed class QrCodeState {}

class QrCodeGenerating extends QrCodeState {}

class UserIdGenerated extends QrCodeState {
  String userId;

  UserIdGenerated({required this.userId}) : super();
}

class ErrorGeneratingUserId extends QrCodeState {
  ErrorGeneratingUserId() : super();
}
