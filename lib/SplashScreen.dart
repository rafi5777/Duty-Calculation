import 'package:flutter/material.dart';

import 'duty.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Duty()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffff7fb),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/calculator.png',
                          height: 150,
                          width: 150,
                        ),
                        SizedBox(height: 10,),
                        Text('Duty Calculation',style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  //child: Image.asset('assets/slashscreen.png',height: 300,width: 240,),
                ),
              ),
            ),
          ),

          // Align(
          //     alignment: Alignment.bottomCenter,
          //     child: //const Text('Power By '),
          //     const Text('Powered By ',style: TextStyle(fontWeight: FontWeight.bold),)
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child:
          //     Image.asset('assets/bgit.png',width: 40,),
          //
          //
          //   ),
          // ),
        ],
      ),
    );
  }
}
