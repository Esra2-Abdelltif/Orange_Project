
import 'package:flutter/material.dart';
import 'package:orange_project/modules/login_screen/login_screen.dart';
import 'package:orange_project/shared/Constans/constans.dart';
import 'package:orange_project/shared/Network/local/cacheHelper.dart';
import 'package:orange_project/shared/Styles/colors.dart';
import 'package:orange_project/shared/Styles/size_config.dart';
import 'package:orange_project/shared/compoenets/components.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingModel{
  final String image;
  final String title;
  final String body;

  BoardingModel({@required this.image,@required this.title,@required this.body});
}
class OnBoardinScreen extends StatefulWidget {
  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  var boardController =PageController();
  //لو عاوزه اخلي لي كل صفحه لون مختلف
 // int _currentPage = 0;
  // List colors = [Color(0xffDAD3C8), Color(0xffFFE5DE), Color(0xffDCF6E6)];

  List<BoardingModel> boarding =[
    BoardingModel(image:'assets/images/OnBoarding1.png' ,
        title: 'Learn a lot of courses in Orange Education',
        body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
    BoardingModel(image:'assets/images/OnBoarding3.png' ,
        title:' Learn a lot of courses in Orange Education',
  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
    BoardingModel(image:'assets/images/OnBoarding3.png' ,
        title: 'Learn a lot of courses in Orange Education',
  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW;
    double height = SizeConfig.screenH;
    double blockH = SizeConfig.blockH;
    double blockV = SizeConfig.blockV;
    return Scaffold(
      //backgroundColor: colors[_currentPage],
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(), //بتشيل اللون الي بيظهر في جنب لما بوصل للنهايه
                itemBuilder: ((context, index) => BuildBoardingItem(boarding[index])),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40,),
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        SmoothPageIndicator(
                        controller: boardController,
                        count: boarding.length,
                        effect:  const ScrollingDotsEffect(
                          activeDotColor: defultColor,
                          dotHeight: 10,
                          dotWidth: 10,
                          //jumpScale: .7,
                          //verticalOffset: 150,

                        ),
                      ),
                      ]
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            defultMaterialButton(height: 50, width: 154,text: 'Join NOw',borderRadius: 5,fontsize: 14,Borderwidth: 0,
                            function:(){
                              NavigateTo(context: context,router: LoginScreen());

                              }
                          ),

                              defultMaterialButton(height: 50, width: 154,text: 'Login',borderRadius: 5,fontsize: 14,ColorText: defultColor,backColor: Colors.white,
                                  function:(){
                                    CacheHelper.saveDate(key:'onBoarding', value: true).then((value) =>
                                        NavigateAndFinsh(router: LoginScreen(),context: context)
                                    );
                                  }
                              ),
                            ],
                          ),
                    )


                  ]
              ),
            ),
        ],),
      )
    );
  }



  Widget BuildBoardingItem(BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(child: Image(image: AssetImage('${model.image}'),height: SizeConfig.blockV * 35,)),
      const SizedBox( height: 30,),
      Center(child: Text('${model.title}',textAlign: TextAlign.center,style: const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600,),)),
      const SizedBox(height: 10,),
      Center(child: Text('${model.body}',textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98),
          fontSize: 17 ))),
      const SizedBox(height: 10,),
    ],
  );
}
