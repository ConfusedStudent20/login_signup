import 'package:flutter/material.dart';
import 'package:flutterconnect/utils/colors.dart';
import 'package:flutterconnect/widgets/app_Style.dart';
import 'package:flutterconnect/widgets/text_FieldInput.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                    controller: usernameController,
                    labelText: 'Username',
                    textInputType: TextInputType.name,
                    icon: const Icon(Icons.person),
                    isSecure: false,
                  ),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      backgroundColor: const Color.fromARGB(255, 145, 144, 144),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Signup',
                      style: appStyle(blackColor, FontWeight.bold, 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have Account ? ',
                        style: appStyle(blackColor, FontWeight.normal, 20),
                      ),
                      InkWell(
                        splashColor: blueColor,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/loginScreen');
                          },
                          child: Text(
                            'Login',
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
