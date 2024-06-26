import 'dart:convert';

// import 'package:Etouchcards/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:nfccard/update_profile.dart';
import 'dpscreen2.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class listdata {
  String user_id;
  String navigation;

  listdata({
    required this.user_id,
    required this.navigation,
  });

  factory listdata.fromJson(Map<String, dynamic> json) {
    return listdata(
      user_id: json['user_id'],
      navigation: json['navigation'],
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var message;
  List<listdata> reportlist = [];

  // Future Insertdata(BuildContext context,String id) async {
  Future<List<listdata>> Insertdata(BuildContext context, String id) async {
    print("jsgdjasfj" + id.toString());
    reportlist.clear();
    var url = Uri.parse(
        // 'https://nfc.futureinfotechservices.in/navigation_credentials1.php');
        'https://nfc.futureinfotechservices.in/navigation_credentials3.php');
    var data = {
      'id': id.toString(),
    }; //to load an rowid  {item is the name used in php file}
    // var response = await http.post(url, body: json.encode(data));
    // message = response.body.toString();
    // print(message.toString());
    // var response = await http.get(url);
    var response = await http.post(url, body: json.encode(data));
    final items = json.decode(response.body);
    items.forEach((api) {
      final ab = new listdata(
        user_id: api['user_id'],
        navigation: api['navigation'],
      );
      reportlist.add(ab);
    });
    print("Useridtest : " + reportlist[0].user_id.toString());
    print("Navigationtest : " + reportlist[0].navigation.toString());
    if(reportlist[0].navigation.toString() == "public view")
    {
    Card_Insertdata(reportlist[0].user_id.toString(),reportlist[0].navigation.toString());
    }
    return reportlist;
  }
  Future Card_Insertdata(String user_id,String navigation) async {

    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/cardviews_insert.php');
    var data = {
      'user_id': user_id.toString(),
      'navigation_type': navigation.toString(),
    };
    var response = await http.post(url, body: json.encode(data));
    var message = response.body.toString();
    print(message.toString());
    if (message.toString().contains('Insert success')) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(message.toString()), backgroundColor: Colors.green));
      // setState(() {});
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(message.toString()), backgroundColor: Colors.red));
      // setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Etouch Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //  home: loginscreen(),
      // home: login(),
      //  home: public(),
      // home: res(),
      //  initialRoute: '/public',
      //initialRoute: '/',
      onGenerateRoute: (settings) {
        final pathSegments = settings.name?.split('/');
        if (int.parse(pathSegments!.length.toString()) > 1) {
          // final id = int.tryParse(pathSegments![1]);
          final id = pathSegments![1].toString();
          print("id from url : "+ id.toString());
          if (id != null) {
            return MaterialPageRoute(
              builder: (context) => FutureBuilder(
                future: Insertdata(context, id.toString()),
                builder: (context, snapshot) {
                  // print("dart name : " + reportlist[0].navigation.toString());
                  // print("userid : " + reportlist[0].user_id.toString());
                  return snapshot.hasData
                      ? (reportlist[0].navigation.toString() ==
                              "update profile")
                          ? admin_update_profile(
                              reportlist[0].user_id.toString())
                          : (reportlist[0].navigation.toString() ==
                                  "public view")
                              ? public(reportlist[0].user_id.toString())
                              : Center(
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator()))
                      : Center(
                          child: Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator()));
                  // print("egdjtu"+reportlist[0].navigation.toString());
                  // print("egfds"+reportlist[0].user_id.toString());
                  // print("egdjtu"+message.toString());
                  // if (message.toString()=="update profile") {
                  // if (reportlist[0].navigation.toString()=="update profile") {
                  //   return admin_update_profile(reportlist[0].user_id.toString());
                  // } else {
                  //   return public(reportlist[0].user_id.toString());
                  // }
                },
              ),
            );
          }
          // FutureBuilder(
          //     future: Insertdata(context,id.toString()),
          //     builder: (context, dataSnapshot) {
          //       return dataSnapshot.hasData
          //           ? Text("")
          //           : Text("");});

          // return MaterialPageRoute(
          //   builder: (context) => admin_update_profile(id.toString()),
          //   // builder: (context) => public(id.toString()),
          // );
          // }
        }
        // switch (settings.name) {
        //
        //   case '/':
        //     final String id = settings.arguments as String;
        //     return MaterialPageRoute(builder: (context) => public(id.toString()));
        //
        //   default:
        //     return null;
        // }
      },
      // routes: {
      //   public.routeName: (context) =>
      //       public(),
      //   // '/home': (context) => public(),
      // },
    );
  }
}
