import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:task/business_logic/global_cubit/task_states.dart';
import 'package:task/data/models/account_model.dart';
import 'package:task/screens/user_data.dart';

class TaskCubit extends Cubit<TaskStates> {
  Dio dio = Dio();
  TaskCubit() : super(InitialState());
  static TaskCubit get(BuildContext context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility;
  bool secure = true;

  changePasswordVisibility() {
    secure = !secure;
    suffix = secure ? Icons.visibility_off : Icons.visibility;
    print(secure);
    emit(ChangePasswordChangeState());
  }

  UserModel ?userModel;
  userLogin({required String email, required String password}) async {
    var response = await dio.post(
        "https://magdsoft-internship.herokuapp.com/api/login",
        data: {"email": email, "password": password}).then((value) {
      print(value.data);

      UserModel userModel = UserModel.fromJson(value.data);
      print(userModel.status);
      print(userModel.account);
      print(userModel.account!.id);

      emit(LoginState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  userRegister(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    var response = await dio
        .post("https://magdsoft-internship.herokuapp.com/api/login", data: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    }).then((value) {
      print(value.data);
      emit(LoginState());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
