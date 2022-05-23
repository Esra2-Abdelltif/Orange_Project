import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project/modules/login_screen/cubit/cubit.dart';
import 'package:orange_project/shared/Styles/colors.dart';
import 'package:orange_project/shared/compoenets/components.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var PhoneController = TextEditingController();
  var nameController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: FormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "REGISTER",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Register now to browse our hot offers",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                   defulutTextFormFild(
                     style: Theme.of(context).textTheme.bodyText2,
                      controller: nameController,
                      type: TextInputType.text,
                     obscureText: false,

                labeltext: 'Full Name',
                hintText: 'Enter Full Name',
                prefix: Icon(Icons.account_circle, color: defultColor,),
                   ),

                    SizedBox(
                      height: 20,
                    ),
                    defulutTextFormFild(
                      style: Theme.of(context).textTheme.bodyText2,
                      controller: emailController,
                      type: TextInputType.emailAddress,

                      labeltext: 'Email Adress',
                      hintText: 'Enter Email Adress',
                      obscureText: false,
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
                    SizedBox(
                      height: 20,
                    ),


                    defulutTextFormFild(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        labeltext: 'Password',
                        hintText: 'Enter Password',                        obscureText: false,

                        // obscureText: LoginCubit.get(context).secirty,
                        onSubmited: (value){
                          if (FormKey.currentState.validate()){
                            print(passwordController.text);
                            //LoginCubit.get(context).UserLogin(email: emailController.text, password:passwordController.text);

                            //NavigateTo(router:WelcomeScreen(),context: context);
                          }
                        },
                        prefix: Icon(Icons.lock, color: defultColor,),
                        //suffix: LoginCubit.get(context).suffix,
                        suffixFun: (){
                          //LoginCubit.get(context).ChangePasswordVisibility();
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
                    SizedBox(
                      height: 20,
                    ),
                    defulutTextFormFild(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: PhoneController,
                        type: TextInputType.phone,
                        labeltext: 'Phone',
                        hintText: 'Enter phone',
                      obscureText: false,

                      prefix: Icon(Icons.phone, color: defultColor,),

                    ),

                    ConditionalBuilder(
                     condition: true,
                      fallback: (context)=>Center(child: CircularProgressIndicator(color: Colors.grey,)),
                      builder: (context)=>
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            onPressed: () {
                              // if (FormKey.currentState!.validate()) {
                              //   RegisterCubit.get(context).UserRegister(name: nameController.text, email: emailController.text, phone: PhoneController.text, password: passwordController.text);
                              // }
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have any account?"),
                        TextButton(
                            onPressed: () {
                             // NavigateToLogin(context);
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
