import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:me_finances/presentation/screen/home_screen.dart';
import 'package:me_finances/presentation/widgets/custom_alert_dialog_widget.dart';
import 'package:me_finances/presentation/widgets/custom_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

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
                  builder: (context) => const CustomAlertDialogWidget(),
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
