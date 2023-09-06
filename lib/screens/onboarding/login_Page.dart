import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:havenmall/constants/constants.dart';
import 'package:havenmall/constants/navigator.dart';
import 'package:havenmall/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:havenmall/screens/onboarding/signup_Page.dart';
import 'package:havenmall/widgets/topTittle.dart';

import '../../widgets/primartButton.dart';
import '../home/home_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () => NavigationHelper.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  )), //InkWell
              const SizedBox(
                height: 18,
              ),
              TopTittle(
                  title: "Login",
                  subtitle: "Welcome back to HavenMall"), //customTopTittle
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                    suffixIcon: obscureText == true
                        ? InkWell(
                            onTap: () {
                              obscureText = false;
                              setState(() {});
                            },
                            child: Icon(Icons.visibility))
                        : InkWell(
                            onTap: () {
                              obscureText = true;
                              setState(() {});
                            },
                            child: Icon(Icons.visibility_off)),
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password)),
              ),

              const SizedBox(
                height: 15,
              ),
              PrimaryButton(
                buttonText: "Login",
                onPressed: () async {
                  bool isvalidated = loginValidation(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      context);
                  if (isvalidated) {
                    var islogin = await FirebaseAuthHelper.instance.login(
                        emailController.text.trim().toString(),
                        passwordController.text.trim().toString(),
                        context);
                    if (islogin) {
                      NavigationHelper.pushreplacement(
                          widget: HomePage(), context: context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              Center(child: Text("Don't have an account ? ")),
              const SizedBox(
                height: 12,
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  NavigationHelper.push(widget: SignupPage(), context: context);
                },
                child: Text(
                  "Create an account",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )),
            ],
          ),
        ),
      ), //Column
    ); //scaffold
  }
}
