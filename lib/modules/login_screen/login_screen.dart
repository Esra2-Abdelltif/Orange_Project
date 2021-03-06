import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orange_project/layout/home_layout/home_layout.dart';
import 'package:orange_project/modules/login_screen/cubit/cubit.dart';
import 'package:orange_project/modules/login_screen/cubit/state.dart';
import 'package:orange_project/modules/logout_screen/logout_screen.dart';
import 'package:orange_project/modules/singUp/singUp.dart';
import 'package:orange_project/shared/Constans/constans.dart';
import 'package:orange_project/shared/Constans/constans.dart';
import 'package:orange_project/shared/Network/local/cacheHelper.dart';
import 'package:orange_project/shared/Styles/colors.dart';
import 'package:orange_project/shared/compoenets/components.dart';

import '../../shared/Constans/constans.dart';

class LoginScreen extends StatelessWidget {


  var formkey =GlobalKey<FormState>();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LogInStates>(
      listener: (BuildContext context,  state) {
        if(state is LoginSuccessState)
          {
            if(state.loginModel.success)
              {
                ErrorShow(massage: state.loginModel.message ,
                    state: ToastState.SUCCESS,
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_LONG);
               CacheHelper.saveDate(key: 'access_token', value: state.loginModel.data.accessToken).then((value)  {
               NavigateAndFinsh(context: context,router: HomeLoyout());
               });
              }
            else{
              ErrorShow(massage: state.loginModel.message ,
                  state: ToastState.ERROR,
                  gravity: ToastGravity.BOTTOM,
                  toastLength: Toast.LENGTH_LONG);
            }
          }
      },
    builder: (BuildContext context,   state) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // Image(image: AssetImage('assets/images/welcome.png'),),
                    Text('Login Now ',
                      style: TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600),),
                    Text('login now to browse our hot offers',
                        style:TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98),)),
                    SizedBox(
                      height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,),
                      child: defulutTextFormFild(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        labeltext: 'Email Adress',
                        hintText: 'Enter Email Adress',
                        obscureText: !_secirty,
                        prefix: Icon(Icons.email, color: defultColor,),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return 'Please a valid Email';
                          }
                          return null;

                        },

                      ),
                    ),
                    SizedBox(
                      height:  20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,),
                      child: defulutTextFormFild(
                          style: Theme.of(context).textTheme.bodyText2,
                          controller: passController,
                          type: TextInputType.text,

                          labeltext: 'Password',
                          hintText: 'Enter Password',
                          obscureText: LoginCubit.get(context).secirty,
                          onSubmited: (value){
                            if (formkey.currentState.validate()){
                              print(passController.text);
                              LoginCubit.get(context).UserLogin(email: emailController.text, password:passController.text);

                              //NavigateTo(router:WelcomeScreen(),context: context);
                            }
                          },
                          prefix: Icon(Icons.lock, color: defultColor,),
                          suffix: LoginCubit.get(context).suffix,
                          suffixFun: (){
                            LoginCubit.get(context).ChangePasswordVisibility();
                          },


                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if(value.length <=5)
                            {
                              return 'Please enter long password';
                            }
                            return null;}

                      ),
                    ),
                    SizedBox(
                      height: 20,),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) => defultMaterialButton(height: 50, width: 250,text: 'LOGIN',
                        function:(){
                          if (formkey.currentState.validate()){
                            LoginCubit.get(context).UserLogin(email: emailController.text, password:passController.text);

                            //NavigateTo(router:WelcomeScreen(),context: context);
                          }
                        },
                      ),
                      fallback: (context) => CircularProgressIndicator(),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ?',style:TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98),)),
                        defultTextButton(text: 'Sign Up...', onPressed:() {
                          NavigateTo(router: RegisterScreen(),context: context);

                        },),

                      ],
                    ),







                  ],
                ),
              ),
            ),
          ),
        )
    );
    }
      )
    );
  }
}
