import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:me_finances/presentation/cubits/resset_password_cubit/resset_password_cubit.dart';
import 'package:me_finances/presentation/screen/home_screen.dart';
import 'package:me_finances/presentation/widgets/custom_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomTextFieldWidget(
              controller: controllerEmail,
              hintText: 'Email',
            ),
            const SizedBox(height: 50),
            CustomTextFieldWidget(
              controller: controllerPassword,
              hintText: 'Password',
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).login(
                    email: controllerEmail.text,
                    password: controllerPassword.text,
                  );
                  // FirebaseServices().createAccout(
                  //   email: controllerEmail.text,
                  //   password: controllerPassword.text,
                  // );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return Image.asset('assets/gif/loading.gif');
                }
                if (state is LoginError) {
                  return Text(
                    state.errorText,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const CustomAlertDialog(),
                );
              },
              child: const Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

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
