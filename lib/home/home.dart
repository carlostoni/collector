import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:estoque/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 6),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const SignInScreen())));
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nome app // App name
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 80,
                        ),
                        children: [
                          TextSpan(
                            text: 'Estoque',
                            style: TextStyle(
                              color: Color.fromARGB(197, 233, 236, 30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                    //Subtitulo //Subtitle
                    SizedBox(
                      height: 60,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 206, 94, 53),
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Estoque'),
                            FadeAnimatedText('Compras'),
                            FadeAnimatedText('Aquisição'),
                          ],
                        ),
                      ),
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
