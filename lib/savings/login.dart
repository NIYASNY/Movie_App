import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_secondapp/savings/second.dart';

class Mylogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyProfile(),
    );
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _formkey = GlobalKey<FormState>();
  final _phonenum = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'LOGIN PROFILE',
          style: TextStyle(fontFamily: "Pacifico"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 60, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://wallpapercave.com/wp/wp5063342.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.red),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    right: 10,
                    left: 10,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please choose your username';
                            } else if (value.length < 6) {
                              return 'Too short username with 6 or more characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade500,
                            filled: true,
                            hintText: 'User Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(
                                r'[0-9]',
                              ),
                            ),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 10,
                          controller: _phonenum,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade500,
                            filled: true,
                            hintText: 'Phone No',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter 10 numbers';
                            } else if (value.length < 10) {
                              return '10 numbers';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _email,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade500,
                            filled: true,
                            hintText: 'E mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            } else if (!value.contains("@") ||
                                !value.contains("gmail.com")) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _password,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade500,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Password';
                            } else if (value.length < 8) {
                              return 'Too short username with 8 or more characters';
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    child: const Text(
                      'Go Back',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Submited'),
                                  content: const Text('Form valid!'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MySecond()));
                                        setState(() {
                                          _formkey.currentState!.reset();
                                        });
                                      },
                                      child: const Text(
                                        "Submitted",
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
