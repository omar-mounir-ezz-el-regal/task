import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/global_cubit/task_cubit.dart';
import 'package:task/business_logic/global_cubit/task_states.dart';
import 'package:task/screens/register_screen.dart';
import 'package:task/screens/user_data.dart';
import 'package:task/styles/colors.dart';
import 'package:task/widget/elevatedbutton_widget.dart';
import 'package:task/widget/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TaskCubit cubit = TaskCubit.get(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: AppColor.blue,
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
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(height: h * .17),
                        Column(
                          children: [
                            TextFormFieldWidget(
                                secure: false,
                                controller: emailController,
                                hintText: "Email",
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email address ';
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            TextFormFieldWidget(
                              controller: passwordController,
                              hintText: "Password",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              },
                              secure: cubit.secure,
                              suffixIcon: cubit.suffix,
                              suffixPressed: () =>
                                  cubit.changePasswordVisibility(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * .20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButtonWidget(
                              primary: AppColor.blue,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ));
                              },
                              elevatedtext: "Register",
                            ),
                            ElevatedButtonWidget(
                                primary: AppColor.blue,
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    TaskCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UserData(),
                                        ));
                                  }
                                },
                                elevatedtext: "login")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
