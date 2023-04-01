// import 'package:app/screen/Components/haveacc.dart';
// import 'package:app/screen/Components/my_button.dart';
import 'package:app/screen/Components/text_form_email.dart';
import 'package:app/screen/Components/text_form_pass.dart';
import 'package:app/screen/Components/title.dart';
import 'package:app/screen/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();

  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(pattern);

  void vaildation(context) {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Both field Is Empty'),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Empty'),
        ),
      );
    }
    if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Not Valid'),
        ),
      );
    } else if (password.text.isEmpty) {
      {
        // ignore: null_check_always_fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email Is Not Valid'),
          ),
        );
      }
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      body: SafeArea(
        child: SingleChildScrollView(
          //key: scaffold,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 530,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(120, 0, 0, 0),
                      blurRadius: 20,
                      // offset: Offset(4, 3),
                      // blurRadius: 20,
                      // color: Color.fromRGBO(0, 0, 0, 0.16),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(450),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/07/13/15/istock-619643870.jpg'),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(
                    //     Color.fromARGB(130, 91, 92, 91), BlendMode.color),
                  ),
                  //color: Color.fromARGB(141, 76, 175, 79),
                ),
                child: TopTitle(
                  title: 'Zero Hunger',
                  //subTitle: 'Welcome Back!',
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Container(
                        height: 160,
                        width: 320,
                        // color: Colors.red,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextEmail(
                              controller: email,
                              hint: 'Username or Email',
                            ),
                            const SizedBox(height: 20),
                            MyTextPass(password, 'password'),
                          ],
                        ),
                      ),
                    ),
                    //*********************** */
                    Container(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          vaildation(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                    ),
                    // MyButton(name: name, onpress: onpress)
                    const SizedBox(height: 20),
                    // HaveAccount(
                    //   question: "Don't Have an Account ?",
                    //   sub: 'SignUp',
                    //   ontap: () {
                    //     Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(
                    //         builder: (ctx) => const SignUp(),
                    //       ),
                    //     );
                    //   },
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have an Account ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const SignUp(),
                              ),
                            );
                          },
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
