import 'dart:convert';

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
    Future<List<listdata>> Insertdata(BuildContext context,String id) async {
      print("jsgdjasfj"+id.toString());
      reportlist.clear();
      var url = Uri.parse('https://nfc.futureinfotechservices.in/navigation_credentials1.php');
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
      return reportlist;
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
            final id = pathSegments![1];
            // if (id != null) {
            return MaterialPageRoute(
              builder: (context) => FutureBuilder(
                future: Insertdata(context,id.toString()),
                builder: (context, snapshot) {
                  print("egdjtu"+reportlist[0].navigation.toString());
                  print("egfds"+reportlist[0].user_id.toString());
                  // print("egdjtu"+message.toString());
                  // if (message.toString()=="update profile") {
                  if (reportlist[0].navigation.toString()=="update profile") {
                    return admin_update_profile(reportlist[0].user_id.toString());
                  } else {
                    return public(reportlist[0].user_id.toString());
                  }
                },
              ),
            );
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

