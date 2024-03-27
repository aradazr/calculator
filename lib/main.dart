import 'package:calculator/Components/color_app.dart';
import 'package:calculator/calc_bttn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: ColorLightApp.backGroundcolor));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ColorLightApp.lightTheme,
      builder: (p0, theme) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const MyCalc(),
      ),
    );
  }
}

class MyCalc extends StatefulWidget {
  const MyCalc({super.key});

  @override
  State<MyCalc> createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  int firstNum = 0;

  int secendtNum = 0;

  String history = '';

  String textToDisplay = '';

  String result = '';

  String operation = '';
  int num = 0;

  void btnOnClick(String bttnVal) {
    if (bttnVal == 'c') {
      firstNum = 0;
      secendtNum = 0;
      result = '';
    } else if (bttnVal == 'AC') {
      firstNum = 0;
      secendtNum = 0;
      result = '';
      history = '';
    } else if (bttnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        result = '-$textToDisplay';
      } else {
        result = textToDisplay.substring(1);
      }
    } else if (bttnVal == '<') {
      result = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (bttnVal == '÷' ||
        bttnVal == '+' ||
        bttnVal == '-' ||
        bttnVal == '×') {
      firstNum = int.parse(textToDisplay);
      result = '';
      operation = bttnVal;
    } else if (bttnVal == '=') {
      secendtNum = int.parse(textToDisplay);
      if (operation == '+') {
        result = (firstNum + secendtNum).toString();
        history =
            firstNum.toString() + operation.toString() + secendtNum.toString();
      }
      if (operation == '-') {
        result = (firstNum - secendtNum).toString();
        history =
            firstNum.toString() + operation.toString() + secendtNum.toString();
      }
      if (operation == '÷') {
        result = (firstNum / secendtNum).toString();
        history =
            firstNum.toString() + operation.toString() + secendtNum.toString();
      }
      if (operation == '×') {
        result = (firstNum * secendtNum).toString();
        history =
            firstNum.toString() + operation.toString() + secendtNum.toString();
      }
    } else {
      result = int.parse(textToDisplay + bttnVal).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var darkTheme = Themes.darkTheme;
    var lightTheme = Themes.lightTheme;
    return ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                    child: ThemeSwitcher(
                      builder: (context) => IconButton(
                        onPressed: () {
                          setState(() {
                            if (num==0) {
                              num++;
                            }else{num--;}
                            var brightness =
                                ThemeModelInheritedNotifier.of(context)
                                    .theme
                                    .brightness;
                            ThemeSwitcher.of(context).changeTheme(
                              theme: brightness == Brightness.light
                                  ? darkTheme
                                  : lightTheme,
                              isReversed:
                                  brightness == Brightness.light ? true : false,
                              // isReversed: false,
                              // isReversed: true,
                            );
                          });
                        },
                        icon: Icon(
                          size: 32,
                          color: ThemeModelInheritedNotifier.of(context)
                                      .theme
                                      .brightness ==
                                  Brightness.light
                              ? Colors.white
                              : Colors.black,
                          ThemeModelInheritedNotifier.of(context)
                                      .theme
                                      .brightness ==
                                  Brightness.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              //! show text before answer
              Align(
                alignment: const Alignment(1, 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 28, 2),
                  child: Text(
                    history,
                    style:  TextStyle(
                        color: ColorLightApp.backNumbers, fontSize: 24),
                  ),
                ),
              ),

              //! final answer
              Align(
                alignment: const Alignment(1, 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 28, 40),
                  child: Text(
                    textToDisplay,
                    style:  TextStyle(
                        color:num==0? ColorLightApp.numbers:Colors.black, fontSize: 48),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorBttn(
                      text: 'AC',
                      numberColor: Colors.black,
                      backGroundcolor: ColorLightApp.greyBttn,
                      textSize: 22,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: 'c',
                      numberColor: Colors.black,
                      backGroundcolor: ColorLightApp.greyBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '<',
                      numberColor: Colors.black,
                      backGroundcolor: ColorLightApp.greyBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '÷',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.blueBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorBttn(
                      text: '7',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '8',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '9',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '×',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.blueBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorBttn(
                      text: '4',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '5',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '6',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '-',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.blueBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorBttn(
                      text: '1',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '2',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '3',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '+',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.blueBttn,
                      textSize: 45,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //? number 0
                    //.9
                    //.19
                    CalculatorBttn(
                      text: '0',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .42,
                    ),
                    CalculatorBttn(
                      text: '+/-',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.numberBttn,
                      textSize: 23,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                    CalculatorBttn(
                      text: '=',
                      numberColor: ColorLightApp.numbers,
                      backGroundcolor: ColorLightApp.blueBttn,
                      textSize: 50,
                      callBack: btnOnClick,
                      height: size.height * .09,
                      width: size.width * .19,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
