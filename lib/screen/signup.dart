// import 'package:app/screen/Components/haveacc.dart';
import 'package:app/screen/Components/text_form_pass.dart';
import 'package:app/screen/Components/title.dart';
import 'package:app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:app/screen/Components/text_form_email.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController repassword = TextEditingController();
  static String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(pattern);

  void vaildation(context) {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        fullname.text.isEmpty &&
        phone.text.isEmpty &&
        address.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter All the filed'),
        ),
      );
    }
    // Name required *****************
    else if (fullname.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name Can't be empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Empty'),
        ),
      );
    } else if (phone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phone Number Is Empty'),
        ),
      );
    } else if (address.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Address Is Empty'),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Not Valid'),
        ),
      );
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Is Not Valid'),
        ),
      );
    } else if (repassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rewrite Password Is Compulsory'),
        ),
      );
    }
  }

  final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 234, 209),
      // key: scaffold,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
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
                    bottomRight: Radius.circular(190),
                    bottomLeft: Radius.circular(190),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/premium-vector/food-donation-box-2d-vector-isolated-illustration-grocery-products-give-away-non-profit-humanitarian-aid-flat-composition-cartoon-background-charity-contribution-colourful-scene_151150-6593.jpg?w=2000'),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(
                    //     Color.fromARGB(130, 91, 92, 91), BlendMode.color),
                  ),
                  //color: Color.fromARGB(141, 76, 175, 79),
                ),
                // child: TopTitle(
                //   title: 'SignUp',
                //   subTitle: 'Create An Account',
                // ),
              ),
              const SizedBox(height: 15),
              Center(
                child: Container(
                  height: 400,
                  width: 370,
                  //color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextEmail(
                          controller: fullname, hint: 'Enter Full Name'),
                      MyTextEmail(controller: email, hint: 'Enter Email'),
                      MyTextEmail(
                          controller: phone, hint: 'Enter Phone Number'),
                      MyTextEmail(controller: address, hint: 'Enter Address'),
                      MyTextPass(password, 'Enter Password'),
                      MyTextPass(repassword, 'Rewrite password'),
                    ],
                  ),
                ),
                /** Button*/
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 150,
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
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //****************************** */
              // HaveAccount(
              //   question: 'Already have an Account? ',
              //   sub: 'Login',
              //   ontap: () {
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(
              //         builder: (ctx) => const Login(),
              //       ),
              //     );
              //   },
              // )

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an Account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
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
      ),
    );
  }
}
