import 'package:flutter/material.dart';
import './savings/login.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/netflixhd.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Text(
                  'Netflix',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
                padding: const EdgeInsets.only(left: 20, top: 60),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 260, top: MediaQuery.of(context).size.height * 0.9),
                child: Column(
                  children: [
                    // Text('Sign In',style: TextStyle(color: Colors.grey,fontFamily: 'Pacifico',fontSize: 30),)
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Mylogin()));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Pacifico',
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
