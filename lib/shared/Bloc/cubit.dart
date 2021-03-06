

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_project/shared/Bloc/states.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialAppStates());
  static  AppCubit get(context) => BlocProvider.of(context);

  //Dark Mode
  bool IsDark=false;
  void ChangeAppMode(){
    IsDark = !IsDark;
    emit(AppChangeModeStates());
  }




  // FancyBottomNavigation

  List<BottomNavigationBarItem> bottomNavigation= const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.category), label: 'Cateogries'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> Screen = [


  ];
  //BottomNavBarState
  int CurrentIndex = 0;


  void ChangeIndex(int index){
    CurrentIndex=index;
    // if (index==1)getSport();
    // if (index==2)getScience();

    emit(AppChangeBottomNavBarStates());
  }


 //  HomeModel homeModel;
 //  void getHomeData(){
 //    emit(LoadingHomeDataStates());
 //    DioHelper.getData(
 //      Url: HOME,
 //      token: token,
 //    ).then((value) {
 //     homeModel =HomeModel.fromJson(value.data);
 //    printFullText(homeModel.data.banners[0].image);
 //     printFullText(homeModel.toString());
 //
 //     emit(SuccessHomeDataStates());
 //
 //
 //    }).catchError((error){
 //      print(error.toString());
 //      emit(ErrorHomeDataStates(error.toString()));
 //
 //
 //    });
 //
 //  }
 //
 //
 // CategoriesDataModel categoriesDataModel;
 //  void getCategoriesData(){
 //    emit(LoadingCategoriesDataStates());
 //    DioHelper.getData(
 //      Url: CATEGORY,
 //      token: token,
 //    ).then((value) {
 //      categoriesDataModel = CategoriesDataModel.fromJson(value.data);
 //      printFullText(categoriesDataModel.toString());
 //
 //      emit(SuccessCategoriesDataStates());
 //
 //
 //    }).catchError((error){
 //      print(error.toString());
 //      emit(ErrorCategoriesDataStates(error.toString()));
 //
 //
 //    });
 //
 //  }

  int indexCarouselSider = 0;

  void ChangeindexCarouselSider(int index) {
    indexCarouselSider = index;
    emit(SuccessCategoriesDataStates());
  }
}

