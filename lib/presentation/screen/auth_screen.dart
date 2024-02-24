import 'package:flutter/material.dart';

import 'package:me_finances/presentation/screen/login_screen.dart';
import 'package:me_finances/presentation/screen/registration_screen.dart';
import 'package:me_finances/presentation/widgets/custom_text_field_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(
                        email: controllerEmail.text,
                        password: controllerPassword.text,
                      ),
                    ),
                  );
                  // BlocProvider.of<AuthCubit>(context).createAccount(
                  //   email: controllerEmail.text,
                  //   password: controllerPassword.text,
                  // );
                },
                child: const Text(
                  'Registr',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // BlocConsumer<AuthCubit, AuthState>(
            //   listener: (context, state) {
            //     if (state is AuthSuccess) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const RegistrationScreen(),
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state is AuthLoading) {
            //       return Image.asset('assets/gif/loading.gif');
            //     }
            //     if (state is AuthError) {
            //       return Text(
            //         state.errorText,
            //         style: const TextStyle(
            //           fontSize: 25,
            //           color: Colors.red,
            //         ),
            //       );
            //     }
            //     return const SizedBox();
            //   },
            // ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: const Text(
                'Login',
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
