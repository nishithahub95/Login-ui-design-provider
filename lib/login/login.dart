import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider_login/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool? checkedValue=false;

  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);
    ValueNotifier<bool> toggle=ValueNotifier<bool>(true);
    return SafeArea(
      child: Scaffold(
       body: Container(
         child: Stack(
           children: [
             Image.asset('images/Photos.jpg',
               fit: BoxFit.cover,
               height: double.infinity,
               width: double.infinity,


             ),
             Padding(
               padding: const EdgeInsets.only(left: 30,top: 20,right: 30),
               child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Container(
                 height: 80,
                 width: 80,
                 decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     gradient: LinearGradient(colors: [Color(0xFFF12711),Color(0xFFF5AF19)])

                 ),

                 child:  SvgPicture.asset('images/user.svg',width: 20,height: 20,color: Colors.white,),),


                 SizedBox(height: 20,),

                 TextFormField(
                   controller: emailController,
                   style: TextStyle(color: Colors.white),
                   cursorColor: Colors.white,

                   decoration: InputDecoration(

                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30),
                       borderSide: BorderSide(color: Colors.white)
                     ),

                     suffixIcon:Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                         shape: BoxShape.circle,
                           gradient: LinearGradient(colors: [Color(0xFFF12711),Color(0xFFF5AF19)])

                         ),

                           child: Icon(Icons.email,size: 20,color: Colors.white),),
                     ) ,

                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                       hintText: 'Email',
                     hintStyle: TextStyle(color: Colors.white),
                       enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(30),
                   borderSide: BorderSide(color: Colors.white)
               ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 ValueListenableBuilder(valueListenable: toggle, builder: (context,value,child){
                   return TextFormField(
                     style: TextStyle(color: Colors.white),
                     cursorColor: Colors.white,


                     obscureText: toggle.value,
                     controller: passwordController,
                     decoration: InputDecoration(
                         focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                             borderSide: BorderSide(color: Colors.white)
                         ),

                       suffix: InkWell(
                           onTap: (){
                             toggle.value=!toggle.value;
                           },
                           child: Icon(toggle.value?Icons.visibility_off:Icons.visibility,color: Colors.white,)),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                             borderSide: BorderSide(color: Colors.white)
                         ),
                         enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(color: Colors.white)
                         ),

                         suffixIcon: Padding(
                           padding: const EdgeInsets.only(right: 10),
                           child: Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 gradient: LinearGradient(colors: [Color(0xFFF12711),Color(0xFFF5AF19)])

                             ),

                             child: Icon(Icons.key,size: 20,color: Colors.white),),
                         ) ,

                         hintText: 'Password',
                         hintStyle: TextStyle(color: Colors.white)
                     ),
                   );
                 }),

                 //SizedBox(height: 20,),
                 CheckboxListTile(
                   side: BorderSide(color: Colors.white),
                   activeColor: Colors.white,
                   checkColor: Colors.black,
                   title: Text("Remember password",style: TextStyle(color: Colors.white,fontSize: 15),),
                   value: checkedValue,
                   onChanged: (newValue) {
                     setState(() {
                       checkedValue = newValue;
                     });
                   },
                   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                           onTap: (){
                             authProvider.login(emailController.text.toString(), passwordController.text.toString());
                           },
                           child: Container(
                               height: 50,
                               width: 150,
                               
                               decoration: BoxDecoration(
                                   color: Colors.teal,
                                   borderRadius: BorderRadius.circular(30),
                                 gradient: LinearGradient(colors: [Color(0xFFF12711),Color(0xFFF5AF19)])

                               ),
                               child: Center(
                                 child:authProvider.loading?CircularProgressIndicator(color: Colors.white,):
                                 Text('Login',style: TextStyle(color: Colors.white),),
                               ),
                             ),

                         ),
                      ),
                      Text('Forget Password?',style: TextStyle(color: Colors.white,fontSize: 11),)
                    ],
                  ),
                  SizedBox(height: 30,),
                 Align(
                   alignment: Alignment.bottomRight,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Column(
                         children: [
                           Text('Don'"'"'t have account?',style: TextStyle(color: Colors.white,fontSize: 15),),
                           Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                         ],
                       ),
                       Container(
                         height: 40,
                         width: 40,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             gradient: LinearGradient(colors: [Color(0xFFF12711),Color(0xFFF5AF19)])

                         ),

                         child: Icon(Icons.navigate_next,size: 25,color: Colors.white),),
                     ],
                   ),
                 )

               ],
           ),
             ), ]
         ),
       ),

      ),
    );
  }
}

