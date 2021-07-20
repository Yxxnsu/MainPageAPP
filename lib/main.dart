import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/// Dependencias 
/// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias 
import 'package:liquid_swipe/liquid_swipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(     
      title: 'Yxxsnu Demo',      
      home: HomePage(),
    );
  }
} 

class HomePage extends StatefulWidget {
  @override
  _PageOnboarding4State createState() => _PageOnboarding4State();
}

class _PageOnboarding4State extends State<HomePage> {
  
  /// Declarar variables 
  int page = 0; // Posición de la página 
  bool enableSlideIcon = true; // Controla el estado de la visibilidad de iconButton para deslizar la pantalla del lado izquierdo 
  bool isDarkGlobal = false; // Controla el brillo de la barra de estado

  @override
  Widget build(BuildContext context) {
    final pages = [
      viewcomponent(
          context: context,
          color: Color.fromRGBO(20, 0, 27, 1.0),
          assetImage: AssetImage("assets/1.png"),
          title2: "해는 빨갛습니다.",
          title1: "그리고 그 해는 우리를 태우죠",
          subTitle: "우린 가끔 그것에서 부터 영감을 받기도 합니다 때론 말이죠. 하지만 그 해는 무엇일까요?",
          isDark: false
          ),
      viewcomponent(
          context: context,
          color: Color.fromRGBO(21, 88, 105, 1.0),
          assetImage: AssetImage("assets/2.png"),
          title2: "여기 사람이 있어요",
          title1: "이 사람은 바로 모험가죠",
          subTitle: "세상에는 많은 모험가가 있습니다. 그 모험가들은 굉장하죠. 당신도 모험가인가요?",
          isDark: false
          ),
      viewcomponent(
          context: context,
          color: Color.fromRGBO(0, 20, 38, 1.0),
          assetImage: AssetImage("assets/3.png"),
          title2: "여기 여우가 있어요",
          title1: "늑대일까요? 여우일까요? ",
          subTitle: "늑대와 여우는 천적입니다. 누가 이길까요? 그건 나도 몰라요 사냥꾼이 이기겠죠!?",
          isDark: false
          ),
      viewcomponent(
          context: context,
          color: Color.fromRGBO(44, 32, 56, 1.0),
          assetImage: AssetImage("assets/4.png"),
          title2: "고독한 인간 내적인 고독함",
          title1: "인간은 본질적으로 고독하다 -임연수 중-",
          subTitle: "인간은 내적인 고독감을 내재하고 있다. 모든 사람이 그렇다. 그렇기에 인간은 사회적이다.",
          isDark: false
          ),
      vistaPerzonalizada(
        context: context,
        text: "Home", 
        color: Colors.white, 
        isDark: true
        ),
    ];
    
    SystemChrome.setSystemUIOverlayStyle(isDarkGlobal ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light);

    return Scaffold(
      body: Builder(
          builder: (context) => LiquidSwipe(
                initialPage: 0,
                fullTransitionValue: 500, 
                enableLoop: false, 
                positionSlideIcon: 0.45, 
                slideIconWidget: Icon(Icons.arrow_back_ios,color: isDarkGlobal ? Colors.black : Colors.white),
                pages: pages, 
                onPageChangeCallback: onPageChangeCallback, 
                waveType: WaveType.liquidReveal, 
          )
      ),
    );
  }
  
  onPageChangeCallback(int lpage) {
    setState(
     
      () {
      page = lpage;
      if (4 == page) {
        
        enableSlideIcon = false;
        
        isDarkGlobal = true;
      } else {
        
        enableSlideIcon = true;
        
        isDarkGlobal = false;
      }
    }
    );
  }
  
  Container viewcomponent({
    required BuildContext context,
    required AssetImage assetImage,
    String title1 = "",
    String title2 = "",
    String subTitle = "",
    Color color = Colors.white,
    bool isDark = false,
  }) {
    
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      //padding: EdgeInsets.all(20.0),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(image: assetImage,width: screenWidth,height: screenHeight * 0.4,fit: BoxFit.fitHeight,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: Container()),
                    InkWell(onTap: (){ Navigator.pop(context); },child: Text("Made By Yxxnsu",style: TextStyle(fontSize: 20.0,color: isDark ? Colors.black : Colors.white,fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            height: screenHeight * 0.6,
            margin: EdgeInsets.only(right: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title2,style: TextStyle(fontSize: 25.0,color: isDark ? Colors.grey : Colors.white,fontFamily: "Product Sans"),),
                Text(title1,style: TextStyle(fontSize: 30.0,color: isDark ? Colors.black : Colors.white,fontFamily: "Product Sans",fontWeight: FontWeight.bold,)),
                SizedBox(height: 20.0),
                Text(subTitle,style: TextStyle(color: isDark ? Colors.grey : Colors.white,fontSize: 20.0,fontFamily: "Product Sans",)),
              ],
            ),
          )
        ],
      ),
    );
  }
  // Devuelve una vista con un boton central
  static Container vistaPerzonalizada(
      {
        required BuildContext context,
        String text = "Iniciar Sesión",
        bool isDark = false,
        Color color = Colors.white,
        Color colorButton = Colors.blue
      }
      ) {
    return Container(
      color: color,
      child: Center(
        child:ElevatedButton(
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(colorButton),
            padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            ),
          onPressed: () =>  Navigator.pop(context),
          child: Text(text,style: TextStyle(fontSize: 20.0),),
          ),
      ),
    );
  }
}
