import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/presentation/cubits/resset_password_cubit/resset_password_cubit.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return AlertDialog(
      content: SizedBox(
        height: 200,
        width: 100,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            BlocBuilder<RessetPasswordCubit, RessetPasswordState>(
              builder: (context, state) {
                if (state is RessetPasswordLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is RessetPasswordError) {
                  return Text(state.errorText);
                }
                if (state is RessetPasswordSuccess) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  );
                }
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<RessetPasswordCubit>(context)
                        .ressetPasswod(email: controller.text);
                  },
                  child: const Text('Reset'),
                );
              },
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        )
      ],
    );
  }
}
