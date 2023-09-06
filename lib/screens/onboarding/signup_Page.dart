import 'package:flutter/material.dart';
import 'package:havenmall/screens/home/home_Page.dart';

import '../../constants/constants.dart';
import '../../constants/navigator.dart';
import '../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import '../../widgets/primartButton.dart';
import '../../widgets/topTittle.dart';
import 'login_Page.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
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
                const TopTittle(
                    title: "Create Account", subtitle: "Welcome  to HavenMall"),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Name", prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      hintText: "Phone", prefixIcon: Icon(Icons.phone_android)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_outlined)),
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
                  buttonText: "Sign-up",
                  onPressed: () async {
                    bool isvalidated = signupValidation(
                        nameController.text.toString(),
                        phoneController.text.toString(),
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        context);
                    if (isvalidated) {
                      var isSignup = await FirebaseAuthHelper.instance.Signup(
                          emailController.text.trim().toString().toLowerCase(),
                          passwordController.text.trim().toString(),
                          context);
                      if (isSignup) {
                        NavigationHelper.pushreplacement(
                            widget: HomePage(), context: context);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(child: Text("I have Already have an account ? ")),
                const SizedBox(
                  height: 12,
                ),
                Center(
                    child: InkWell(
                  onTap: () {
                    NavigationHelper.push(
                        widget: LoginPage(), context: context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )),
              ],
            ),
          ),
        ),
      ), //Column
    ); //scaffold
  }
}
