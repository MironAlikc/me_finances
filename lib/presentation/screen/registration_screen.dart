import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/data/models/user_data_model.dart';

import 'package:me_finances/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:me_finances/presentation/screen/home_screen.dart';
import 'package:me_finances/presentation/widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({
    super.key,
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    final controllerName = TextEditingController();
    final controllerSureName = TextEditingController();
    final controllerAge = TextEditingController();
    final controllerGender = TextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomTextFieldWidget(
              controller: controllerName,
              hintText: 'Name',
            ),
            const SizedBox(height: 25),
            CustomTextFieldWidget(
              controller: controllerSureName,
              hintText: 'Sure Name',
            ),
            const SizedBox(height: 25),
            CustomTextFieldWidget(
              controller: controllerAge,
              hintText: 'Age',
            ),
            const SizedBox(height: 25),
            CustomTextFieldWidget(
              controller: controllerGender,
              hintText: 'Gender',
            ),
            const SizedBox(height: 25),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).createAccount(
                      email: email,
                      password: password,
                      model: UserDataModel(
                        name: controllerName.text,
                        sureName: controllerSureName.text,
                        gender: controllerGender.text,
                        age: int.tryParse(controllerAge.text) ?? 0,
                        id: auth.currentUser?.uid ?? '',
                        image:
                            'https://img.freepik.com/premium-psd/chibi-character-cute-cartoon-transparent-background_357958-1285.jpg?w=1380',
                      ),
                    );

                    // BlocProvider.of<LoginCubit>(context).login(
                    //   email: controllerEmail.text,
                    //   password: controllerPassword.text,
                    //);
                    ////////////////////////////////////////////////
                    // FirebaseServices().createUserData(
                    //   model: UserDataModel(
                    //     name: controllerName.text,
                    //     sureName: controllerSureName.text,
                    //     gender: controllerGender.text,
                    //     age: int.tryParse(controllerAge.text) ?? 0,
                    //     id: auth.currentUser?.uid ?? '',
                    //     image:
                    //         'https://img.freepik.com/premium-psd/chibi-character-cute-cartoon-transparent-background_357958-1285.jpg?w=1380',
                    //   ),
                    // );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
