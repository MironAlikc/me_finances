import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:me_finances/data/models/user_data_model.dart';
import 'package:me_finances/firebase_services.dart';
import 'package:me_finances/presentation/widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {
                  // BlocProvider.of<LoginCubit>(context).login(
                  //   email: controllerEmail.text,
                  //   password: controllerPassword.text,
                  //);
                  FirebaseServices().createUserData(
                    model: UserDataModel(
                      name: controllerName.text,
                      sureName: controllerSureName.text,
                      gender: controllerGender.text,
                      age: int.tryParse(controllerAge.text) ?? 0,
                      id: auth.currentUser?.uid ?? '',
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
          ],
        ),
      ),
    );
  }
}
