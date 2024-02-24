import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:me_finances/firebase_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth.currentUser?.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: FirebaseServices().getUserData(
            auth.currentUser?.uid ?? '',
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                        snapshot.data?.first.image ?? '',
                      ),
                    ),
                    Text(
                      '${snapshot.data?.first.name} ${snapshot.data?.first.sureName}',
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      snapshot.data?.first.age.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
