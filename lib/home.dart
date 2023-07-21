import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  // initState(){
  //   super.initState();
  //   fetchData();
  // }

  Future <dynamic> getdata() async{
    var response = await get(
        Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"));
    if(response.statusCode==200){
      print('success');
      // var data=jsonDecode(response.body);
      // var list1=
      return jsonDecode(response.body);
    }
    // if (jsonDecode(response.body)[0]['result'] == 'success') {
    //
    //   return jsonDecode(response.body);
    // }
    else {
      Text('No Data');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff19AABB),
            title: Text('Employee List',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),),
            ),
      body: SafeArea(
        child: Container(
        height: double.infinity,
        child: FutureBuilder(
        future: getdata(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.hasError) {
          //   print(snapshot.hasError);
          // }
      return ListView.builder(
          itemCount:snapshot.data.length,
          itemBuilder: (context, index) {
            return ListTile(
                  leading: CircleAvatar(
                  backgroundImage: NetworkImage('${snapshot.data[index]['profile_image']}'),
                  ),
              title: Text('${snapshot.data[index]['name']}'),
              subtitle:Text('${snapshot.data[index]['email']}'),
            );
          });
    }),
        ),
      ),
    );
  }
}
