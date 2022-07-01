import 'package:flutter/material.dart';
import 'package:task/business_logic/global_cubit/task_cubit.dart';
import 'package:task/screens/login_screen.dart';
import 'package:task/screens/user_data.dart';
import 'package:task/styles/colors.dart';
import 'package:task/widget/elevatedbutton_widget.dart';
import 'package:task/widget/textformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xff005DA3),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: h * .05,
                // ),
                SizedBox(
                  child: Image.asset("images/logo.png"),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  width: w,
                  height: h,
                  child: Column(
                    children: [
                      SizedBox(height: h * .08),
                      Column(
                        children: [
                          TextFormFieldWidget(
                            controller: fullNameController,
                            hintText: "Full Name",
                            secure: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormFieldWidget(
                            controller: emailController,
                            hintText: "Email",
                            secure: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormFieldWidget(
                            controller: phoneController,
                            hintText: "Phone",
                            secure: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormFieldWidget(
                            controller: passwordController,
                            hintText: "Password",
                            suffixIcon: Icons.visibility_off,
                            secure: true,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          TextFormFieldWidget(
                              controller: confirmPasswordController,
                              hintText: "Confirm Password",
                              suffixIcon: Icons.visibility_off,
                              secure: true),
                        ],
                      ),
                      SizedBox(
                        height: h * .06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButtonWidget(
                            primary: AppColor.blue,
                            onPressed: () async {
                              await TaskCubit.get(context).userRegister(
                                  name: fullNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            elevatedtext: "Register",
                          ),
                          ElevatedButtonWidget(
                            primary: AppColor.blue,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserData(),
                                  ));
                            },
                            elevatedtext: "Login",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
