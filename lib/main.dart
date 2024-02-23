import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_finances/firebase_options.dart';
import 'package:me_finances/firebase_services.dart';
import 'package:me_finances/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:me_finances/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:me_finances/presentation/cubits/resset_password_cubit/resset_password_cubit.dart';
import 'package:me_finances/presentation/screen/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirebaseServices(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              repositiry: RepositoryProvider.of<FirebaseServices>(context),
            ),
          ),
          BlocProvider(
            create: (context) => RessetPasswordCubit(
              repositiry: RepositoryProvider.of<FirebaseServices>(context),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              repositiry: RepositoryProvider.of<FirebaseServices>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthScreen(),
        ),
      ),
    );
  }
}
