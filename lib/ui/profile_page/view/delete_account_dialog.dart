import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_bloc.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_event.dart';

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
            context.read<DoneeBloc>().add(
                  const DeleteDonee(
                    doneeId: "70227b70-d333-4922-82e5-6eece6875467",
                  ),
                );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
