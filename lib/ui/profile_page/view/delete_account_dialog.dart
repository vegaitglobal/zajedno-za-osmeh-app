import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/profile_page/bloc/profile_bloc.dart';
import 'package:gu_mobile/ui/profile_page/bloc/profile_event.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Izbrišite nalog"),
      content: const Text("Da li ste sigurni da želite da izbrišete nalog?"),
      actions: [
        TextButton(
          child: const Text("Otkaži", style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text(
            "Potvrdi",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            context.read<ProfileBloc>().add(
                  const DeleteProfile(),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
