import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_login/provider/auth_provider.dart';

import 'login/login.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final theamChanger=Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider())
      ],
      child: MaterialApp(
                debugShowCheckedModeBanner: false,

                home: LoginScreen(),
              ),
    );

      }
}
