import 'dart:convert';

import 'package:client_server_flutter/model/model_user.dart';
import 'package:client_server_flutter/uiView/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageListUserView extends StatefulWidget {
  const PageListUserView({super.key});

  @override
  State<PageListUserView> createState() => _PageListUserViewState();
}

class _PageListUserViewState extends State<PageListUserView> {

  bool isLoading = false;
  List<ModelUser> listUsers = [];

  Future getUser() async{
    try{
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = res.body;

      setState(() {
        var decodedData = json.decode(data);
        for(var i in decodedData){
          listUsers.add(ModelUser.fromJson(i));
        }
      });
    }
    catch(e){
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User')
      ),

      body: ListView.builder(
          itemCount: listUsers.length,
          itemBuilder: (context, index){
            return Padding(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Card(
                  child: ListTile(
                    title: Text(listUsers[index].name ?? "",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username : " +listUsers[index].username),
                          Text("Email : " +listUsers[index].email),
                          Text("Address Street : "+listUsers[index].address.street),
                          Text("Address Suite : "+listUsers[index].address.suite),
                          Text("Address City : "+listUsers[index].address.city),
                          Text("Address Zipcode : "+listUsers[index].address.zipcode),
                          Text("Address Lat : "+listUsers[index].address.geo.lat),
                          Text("Address Lng : "+listUsers[index].address.geo.lng),
                          Text("Phone : "+listUsers[index].phone),
                          Text("Website : "+listUsers[index].website),
                          Text("Company Name : "+listUsers[index].company.name),
                          Text("Company CatchPhrase : "+listUsers[index].company.catchPhrase),
                          Text("Company Bs : "+listUsers[index].company.bs),

                        ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageDetailUser(user: listUsers[index]),
                        ),
                      );
                    },

                  ),
              ),
            );
          }
      ),
    );
  }
}
