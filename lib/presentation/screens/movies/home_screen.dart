import 'package:cinema/config/contantants/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const name ='home-screen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Text(
             Environment.theMovieDbKey
         ),
      )
    );
  }
}