import 'package:flutter/material.dart';
import 'package:login_feature/model/user_model.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({ Key? key, required this.user }) : super(key: key);

  UserModel user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('assets/images/steven.png',width: 80,height: 80)),
                  ),
                ),
                SizedBox(height: 10,),
                Center(child: Text('${user.fullName}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.person), onPressed: null),
                    Text(user.username),
                  ],
                ),
                 Row(
                    children: [
                      IconButton(icon: Icon(Icons.location_city), onPressed: null),
                      Flexible(child: Text(user.address)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.email), onPressed: null),
                      Flexible(child: Text(user.email)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.phone), onPressed: null),
                      Flexible(child: Text(user.phone)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.description), onPressed: null),
                      Flexible(child: Text(user.desc,textAlign: TextAlign.justify),),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(onPressed: (){
                return Navigator.pop(context);
              }, child: Text('LOGOUT'))),
          )],
        ),
      )
    );
  }
}