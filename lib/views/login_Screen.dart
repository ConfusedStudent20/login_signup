// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutterconnect/controller/authentication.dart';
import 'package:flutterconnect/utils/colors.dart';
import 'package:flutterconnect/widgets/app_Style.dart';
import 'package:flutterconnect/widgets/snackbar_Message.dart';
import 'package:flutterconnect/widgets/text_FieldInput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void logUser() async {
    setState(() {
      isLoading = true;
    });
    String logIn = await Authentication().logInUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (logIn == 'success') {
      Navigator.of(context).pushNamed('/homeScreen');
      showSnackBarMessage(context, 'Logged In Successfully');
      emailController.clear();
      passwordController.clear();
    }
    setState(() {
      isLoading = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(blueColor, BlendMode.color)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 190,
            left: MediaQuery.of(context).size.width / 2 - 70,
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/confused.jpg'),
              radius: 80,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 1,
            child: Card(
              elevation: 6.0,
              color: const Color.fromARGB(255, 210, 214, 253),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  TextFieldInput(
                    controller: emailController,
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    icon: const Icon(Icons.email),
                    isSecure: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    controller: passwordController,
                    labelText: 'Password',
                    textInputType: TextInputType.name,
                    icon: const Icon(Icons.key_outlined),
                    isSecure: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: isLoading ? null : logUser,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      backgroundColor: const Color.fromARGB(255, 145, 144, 144),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Login',
                            style: appStyle(blackColor, FontWeight.bold, 20),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'or login with',
                    style: appStyle(blackColor, FontWeight.normal, 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/facebook.jpg'),
                        radius: 30,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/google.jpg'),
                        radius: 30,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/github.jpg'),
                        radius: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Account ? ',
                        style: appStyle(blackColor, FontWeight.normal, 20),
                      ),
                      InkWell(
                        splashColor: blueColor,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/signupScreen');
                          },
                          child: Text(
                            'Signup',
                            style: appStyle(blueColor, FontWeight.normal, 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
