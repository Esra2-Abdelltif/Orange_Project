import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project/model/login_model/login_model.dart';
import 'package:orange_project/modules/login_screen/cubit/state.dart';
import 'package:orange_project/shared/Network/remote/dio_helper.dart';


import '../../../shared/Network/end_point/end_point.dart';

class LoginCubit extends Cubit<LogInStates>
{
  LoginCubit() : super(InitialLogInStates());
  static  LoginCubit get(context) => BlocProvider.of(context);
  //هعمل object من model عشان اعرف acess عليه و اخد منه data
  LoginModel loginModel;

  void UserLogin({@required String email ,@required String password}){
    emit(LoginLoadingState());
    DioHelper.postData(Url: LOGIN,
        data:{
      'access_token':email,
      'refresh_token':password,
    },
    ).then((value) {
     loginModel= LoginModel.fromJson(value.data);
      print(loginModel.message);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix= Icons.visibility;
  bool secirty = true;
  void ChangePasswordVisibility(){
    secirty =!secirty;
   suffix= secirty ? Icons.visibility : Icons.visibility_off;
   emit(ChangePasswordVisibilityState());


  }

}