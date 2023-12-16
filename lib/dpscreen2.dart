import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html';
import 'dart:html' as html;
import 'package:vcard_maintained/vcard_maintained.dart';
import 'dart:js' as js;


class multiple_listdata {
  String id;
  String image;
  String imageindex;

  multiple_listdata({
    required this.id,
    required this.image,
    required this.imageindex,
  });

  factory multiple_listdata.fromJson(Map<String, dynamic> json) {
    return multiple_listdata(
      id: json['id'],
      image: json['image'],
      imageindex: json['full_name'],
    );
  }
}

class listdata2 {
  String id;
  String cusname;
  String companyname;
  String profileimg;
  String jobrole;
  String aboutme;
  String whatsapp;
  String insta;
  String youtube;
  String facebook;
  String telegram;
  String twitter;
  String linkedin;
  String phone;
  String mobile;
  String email;
  String email1;
  String website;
  String address;
  String qrcodeimg;
  String bannerimage;
  String google_map_link;
  String image1;
  String image2;
  String image3;
  String pdf;

  listdata2({
    required this.id,
    required this.cusname,
    required this.companyname,
    required this.profileimg,
    required this.jobrole,
    required this.aboutme,
    required this.whatsapp,
    required this.telegram,
    required this.linkedin,
    required this.twitter,
    required this.phone,
    required this.mobile,
    required this.insta,
    required this.facebook,
    required this.youtube,
    required this.address,
    required this.email,
    required this.email1,
    required this.website,
    required this.qrcodeimg,
    required this.bannerimage,
    required this.google_map_link,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.pdf,
  });

  factory listdata2.fromJson(Map<String, dynamic> json) {
    return listdata2(
      id: json['id'],
      cusname: json['cusname'],
      companyname: json['companyname'],
      profileimg: json['profileimg'],
      jobrole: json['jobrole'],
      aboutme: json['aboutme'],
      whatsapp: json['whatsapp'],
      phone: json['phone'],
      mobile: json['mobile'],
      insta: json['insta'],
      facebook: json['facebook'],
      youtube: json['youtube'],
      twitter: json['twitter'],
      telegram: json['telegram'],
      linkedin: json['linkedin'],
      address: json['address'],
      email: json['email'],
      email1: json['email1'],
      website: json['website'],
      qrcodeimg: json['qrcodeimg'],
      bannerimage: json['bannerimage'],
      google_map_link: json['google_map_link'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      pdf: json['pdf'],
    );
  }
}

class public extends StatefulWidget {
  // static const routeName = '/public';
  String? id;
  public(this.id);

  @override
  State<public> createState() => public1(id);
}

class public1 extends State<public> {
  List<listdata2> listdata1 = [];
  late Future<List> multiple_Future;
  List<multiple_listdata> multiplelist = [];
  String? id;
  public1(this.id);

  Future<List<multiple_listdata>> downloadJSON_multiple(context) async {
    multiplelist.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    final company_id = prefs.getString('company_id') ?? '';

    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/updateprofile_multipleimage.php');
    var data = {
      'user_id': id.toString(),
      'company_id': 0,
    }; //to load an rowid  {item is the name used in php file}
    // var response = await http.get(url);
    var response = await http.post(url, body: json.encode(data));

    final items = json.decode(response.body);

    items.forEach((api) {
      final ab = new multiple_listdata(
        id: api['id'],
        image: api['image'],
        imageindex: api['imageindex'],
      );
      multiplelist.add(ab);
    });
    return multiplelist;
  }

  Future<List<listdata2>> leadlistdownloadJSON(context) async {
    listdata1.clear();
    print("Aaaa"+id.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final companyid = prefs.getString('companyid') ?? '';
    final user_id = prefs.getString('user_id') ?? '';
    var url =
        Uri.parse('https://nfc.futureinfotechservices.in/profile_list1.php');
    var data = {
      'companyid': '0',
      'user_id': id.toString(),
    }; //to load an rowid  {item is the name used in php file}
    // var response = await http.get(url);
    var response = await http.post(url, body: json.encode(data));
    // var response = await http.get(url);
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text(response.body.toString()),
    // ));
    final items = json.decode(response.body);

    items.forEach((api) {
      final ab = new listdata2(
        id: api['id'],
        cusname: api['full_name'],
        companyname: api['company_name'],
        profileimg: api['profile_image'],
        jobrole: api['designation'],
        aboutme: api['about'],
        whatsapp: api['whatsapp_no'],
        phone: api['contact_number'],
        mobile: api['contact_number2'],
        insta: api['instagram_details'],
        facebook: api['facebook_details'],
        youtube: api['youtube'],
        telegram: api['telegram_url'],
        twitter: api['twitter_details'],
        linkedin: api['linkedin_details'],
        address: api['office_address'],
        email: api['email_address'],
        email1: api['email_address2'],
        website: api['web_link'],
        qrcodeimg: api['upi_payment_scanner'],
        bannerimage: api['banner_image'],
        google_map_link: api['google_map_link'],
        image1: api['image1'],
        image2: api['image2'],
        image3: api['image3'],
        pdf: api['pdf'],
      );
      listdata1.add(ab);
    });

    print('screenwidth' + MediaQuery.of(context).size.width.toString());
    print('screenheight' + MediaQuery.of(context).size.height.toString());
    print('hisdfsidh' + listdata1[0].profileimg.toString());
    print('link' + listdata1[0].google_map_link.toString());
    return listdata1;
  }

  @override
  void initState() {
    multiple_Future = downloadJSON_multiple(context);

print("Argument :"+id.toString());
    var url = window.location.href;
    print("url :"+url.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E9E9),
        body: FutureBuilder(
            future: leadlistdownloadJSON(context),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? SingleChildScrollView(
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 200.0,
                              width: MediaQuery.of(context).size.width,

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                          image: NetworkImage(
                                              listdata1[0].bannerimage.toString()),
                                          fit: BoxFit.fill),
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Color(0xff007356).withOpacity(0.8),
                                    Color(0xffE9E9E9).withOpacity(0.0),

                                  ],
                                ),
                                borderRadius: new BorderRadius.vertical(
                                          bottom: new Radius.elliptical(
                                              MediaQuery.of(context).size.width,
                                              150.0)
                                          // bottomRight: Radius.circular(80),
                                          // bottomLeft: Radius.circular(80),
                                          ),
                              ),
                            ),


                            // Container(
                            //   height: 200.0,
                            //   width: MediaQuery.of(context).size.width,
                            //   decoration: BoxDecoration(
                            //       gradient: LinearGradient(
                            //        end: Alignment.bottomCenter,
                            //           colors: [ Color(0xffE9E9E9)],
                            //           stops: [10]
                            //       ),
                            //     borderRadius: new BorderRadius.vertical(
                            //         bottom: new Radius.elliptical(
                            //             MediaQuery.of(context).size.width, 150.0)
                            //       // bottomRight: Radius.circular(80),
                            //       // bottomLeft: Radius.circular(80),
                            //     ),
                            //   ),
                            //  child:Container(  height: 200.0,
                            //    width: MediaQuery.of(context).size.width,
                            //    child: Image.network(
                            //     listdata1[0].bannerimage.toString(),
                            //     height: 200.0,
                            //     width: MediaQuery.of(context).size.width,
                            //   ),
                            //  )
                            // ),

                            SizedBox(
                              height: 80,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Color(0xffE9E9E9),
                                    child: Center(
                                      child: Text(
                                        listdata1[0]
                                            .cusname
                                            .toUpperCase()
                                            .toString(),
                                        style: TextStyle(
                                            color: Color(0xff007356),
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Color(0xffE9E9E9),
                                    child: Center(
                                      child: Text(
                                        listdata1[0].companyname.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Color(0xffE9E9E9),
                                    child: Center(
                                      child: Text(
                                        listdata1[0].jobrole.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Container(
                                        color: Color(0xffE9E9E9),
                                        child: Center(
                                          child: Text(
                                            'ABOUT ME :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ]),
                            Padding(
                                padding: EdgeInsets.fromLTRB(25, 2, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        color: Color(0xffE9E9E9),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        child: Text(
                                          listdata1[0].aboutme.toString(),
                                          maxLines: null,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ])),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      color: Color(0xffE9E9E9),
                                      child: Center(
                                        child: Text(
                                          'QUICK CONNECT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  25, 5, 25, 5),
                              child: Wrap(
                                //direction: Axis.vertical,
                                runSpacing: 20.0,
                                spacing: 20.0,
                                crossAxisAlignment:
                                WrapCrossAlignment.center,
                                //alignment: WrapAlignment.center,
                                children: <Widget>[
                                  // (listdata1[0]
                                  //     .whatsapp
                                  //     .toString() !=
                                  //     '0')
                                  //     ? SizedBox(
                                  //   width: 30,
                                  // )
                                  //     : Text(''),
                                  if(listdata1[0]
                                      .whatsapp
                                      .toString() !=
                                      '0')
                                    Container(
                                        height: 60,
                                        width: 60,
                                        child: Material(
                                          // needed
                                          color: Colors
                                              .transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var contact =
                                              listdata1[0]
                                                  .whatsapp
                                                  .toString();
                                              var androidUrl =
                                                  "whatsapp://send?phone=$contact&text=Hi";
                                              var iosUrl =
                                                  "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

                                              js.context
                                                  .callMethod(
                                                  'open',
                                                  [
                                                    iosUrl
                                                  ]);
                                            }, // needed
                                            child:
                                            Image.asset(
                                              "assects/whatsapplogo.png",
                                              height: 60,
                                              width: 60,
                                              fit: BoxFit
                                                  .cover,
                                            ),
                                          ),
                                        )),
                                  // : Text(''),
                                  // (listdata1[0]
                                  //             .facebook
                                  //             .toString() !=
                                  //         '')
                                  //     ? SizedBox(
                                  //         width: 30,
                                  //       )
                                  //     : Text(''),
                                  if(listdata1[0]
                                      .facebook
                                      .toString() !=
                                      '')
                                    Container(
                                        height: 53,
                                        width: 60,
                                        child: Material(
                                          // needed
                                          color: Colors
                                              .transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              // url_launcher: ^6.2.1

                                              // _launchURL(listdata1[0].facebook.toString());

                                              var url = listdata1[
                                              0]
                                                  .facebook
                                                  .toString();
                                              js.context
                                                  .callMethod(
                                                  'open',
                                                  [url]);
                                              // if (await canLaunch(url)) {
                                              //   await launch(url);
                                              // } else {
                                              //   throw 'Could not launch $url';
                                              // }
                                            }, // needed
                                            child:
                                            Image.asset(
                                              "assects/fblogo3.jpg",
                                              height: 53,
                                              width: 60,
                                              fit: BoxFit
                                                  .cover,
                                            ),
                                          ),
                                        )),
                                  //: Text(''),
                                  // (listdata1[0]
                                  //             .insta
                                  //             .toString() !=
                                  //         '')
                                  //     ? SizedBox(
                                  //         width: 30,
                                  //       )
                                  //     : Text(''),
                                  if(listdata1[0]
                                      .insta
                                      .toString() !=
                                      '')
                                    Material(
                                      // needed
                                      color: Colors
                                          .transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          var url =
                                          listdata1[0]
                                              .insta
                                              .toString();
                                          if (await canLaunch(
                                              url)) {
                                            await launch(
                                                url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }, // ned
                                        child: Image.asset(
                                          "assects/instalogo.png",
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  //: Text(''),
                                  // (listdata1[0]
                                  //             .youtube
                                  //             .toString() !=
                                  //         '')
                                  //     ? SizedBox(
                                  //         width: 30,
                                  //       )
                                  //     : Text(''),
                                  if(listdata1[0]
                                      .youtube
                                      .toString() !=
                                      '')
                                    Material(
                                      // needed
                                      color: Colors
                                          .transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          var url =
                                          listdata1[0]
                                              .youtube
                                              .toString();
                                          js.context
                                              .callMethod(
                                              'open',
                                              [url]);
                                          // if (await canLaunch(url)) {
                                          //   await launch(url);
                                          // } else {
                                          //   throw 'Could not launch $url';
                                          // }
                                        }, // needed
                                        child: Image.asset(
                                          "assects/youtubelogo.png",
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  //: Text(''),
                                  if(listdata1[0]
                                      .linkedin
                                      .toString() !=
                                      '')
                                    Container(
                                        height: 53,
                                        width: 60,
                                        child: Material(
                                          // needed
                                          color: Colors
                                              .transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = listdata1[
                                              0]
                                                  .linkedin
                                                  .toString();
                                              js.context
                                                  .callMethod(
                                                  'open',
                                                  [url]);
                                              // if (await canLaunch(url)) {
                                              //   await launch(url);
                                              // } else {
                                              //   throw 'Could not launch $url';
                                              // }
                                            },
                                            child:
                                            Image.asset(
                                              "assects/linkedinlogo.png",
                                              height: 53,
                                              width: 60,
                                              fit: BoxFit
                                                  .cover,
                                            ),
                                          ),
                                        )),
                                  // : Text(''),
                                  // (listdata1[0]
                                  //             .twitter
                                  //             .toString() !=
                                  //         '')
                                  //     ? SizedBox(
                                  //         width: 30,
                                  //       )
                                  //     : Text(''),
                                  if(listdata1[0]
                                      .twitter
                                      .toString() !=
                                      '')
                                    Container(
                                        height: 53,
                                        width: 60,
                                        child: Material(
                                          // needed
                                          color: Colors
                                              .transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              // url_launcher: ^6.2.1

                                              // _launchURL(listdata1[0].facebook.toString());

                                              var url =
                                              listdata1[0]
                                                  .twitter
                                                  .toString();
                                              js.context
                                                  .callMethod(
                                                  'open',
                                                  [url]);
                                              // if (await canLaunch(url)) {
                                              //   await launch(url);
                                              // } else {
                                              //   throw 'Could not launch $url';
                                              // }
                                            }, // needed
                                            child:
                                            Image.asset(
                                              "assects/twitterlogo.png",
                                              height: 53,
                                              width: 60,
                                              fit: BoxFit
                                                  .cover,
                                            ),
                                          ),
                                        )),
                                  //: Text(''),
                                  // (listdata1[0]
                                  //             .telegram
                                  //             .toString() !=
                                  //         '')
                                  //     ? SizedBox(
                                  //         width: 30,
                                  //       )
                                  //     : Text(''),
                                  if(listdata1[0]
                                      .telegram
                                      .toString() !=
                                      '')
                                    Container(
                                        height: 60,
                                        width: 60,
                                        child: Material(
                                          // needed
                                          color: Colors
                                              .transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = listdata1[
                                              0]
                                                  .telegram
                                                  .toString();
                                              js.context
                                                  .callMethod(
                                                  'open',
                                                  [url]);
                                              // if (await canLaunch(url)) {
                                              //   await launch(url);
                                              // } else {
                                              //   throw 'Could not launch $url';
                                              // }
                                            }, // ned
                                            child:
                                            Image.asset(
                                              "assects/telegramlogo.png",
                                              height: 53,
                                              width: 60,
                                              fit: BoxFit
                                                  .cover,
                                            ),
                                          ),
                                        ))
                                  //: Text(''),
                                ],
                              ),

                            ),
                            // Padding(
                            //   padding: EdgeInsets.fromLTRB(
                            //       25, 5, 25, 5),
                            //   child: Wrap(
                            //     //direction: Axis.vertical,
                            //     runSpacing: 20.0,
                            //     spacing: 20.0,
                            //     crossAxisAlignment:
                            //     WrapCrossAlignment.center,
                            //     //alignment: WrapAlignment.center,
                            //     children: <Widget>[
                            //       // (listdata1[0]
                            //       //     .whatsapp
                            //       //     .toString() !=
                            //       //     '0')
                            //       //     ? SizedBox(
                            //       //   width: 30,
                            //       // )
                            //       //     : Text(''),
                            //       (listdata1[0]
                            //           .whatsapp
                            //           .toString() !=
                            //           '0')
                            //           ? Container(
                            //           height: 60,
                            //           width: 60,
                            //           child: Material(
                            //             // needed
                            //             color: Colors
                            //                 .transparent,
                            //             child: InkWell(
                            //               onTap: () async {
                            //                 var contact =
                            //                 listdata1[0]
                            //                     .whatsapp
                            //                     .toString();
                            //                 var androidUrl =
                            //                     "whatsapp://send?phone=$contact&text=Hi";
                            //                 var iosUrl =
                            //                     "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
                            //
                            //                 js.context
                            //                     .callMethod(
                            //                     'open',
                            //                     [
                            //                       iosUrl
                            //                     ]);
                            //               }, // needed
                            //               child:
                            //               Image.asset(
                            //                 "assects/whatsapplogo.png",
                            //                 height: 60,
                            //                 width: 60,
                            //                 fit: BoxFit
                            //                     .cover,
                            //               ),
                            //             ),
                            //           ))
                            //           : Text(''),
                            //       // (listdata1[0]
                            //       //             .facebook
                            //       //             .toString() !=
                            //       //         '')
                            //       //     ? SizedBox(
                            //       //         width: 30,
                            //       //       )
                            //       //     : Text(''),
                            //       (listdata1[0]
                            //           .facebook
                            //           .toString() !=
                            //           '')
                            //           ?
                            //       Container(
                            //           height: 60,
                            //           width: 60,
                            //           child: Material(
                            //             // needed
                            //             color: Colors
                            //                 .transparent,
                            //             child: InkWell(
                            //               onTap: () async {
                            //                 // url_launcher: ^6.2.1
                            //
                            //                 // _launchURL(listdata1[0].facebook.toString());
                            //
                            //                 var url = listdata1[
                            //                 0]
                            //                     .facebook
                            //                     .toString();
                            //                 js.context
                            //                     .callMethod(
                            //                     'open',
                            //                     [url]);
                            //                 // if (await canLaunch(url)) {
                            //                 //   await launch(url);
                            //                 // } else {
                            //                 //   throw 'Could not launch $url';
                            //                 // }
                            //               }, // needed
                            //               child:
                            //               Image.asset(
                            //                 "assects/fblogo2.png",
                            //                 height: 60,
                            //                 width: 60,
                            //                 fit: BoxFit
                            //                     .cover,
                            //               ),
                            //             ),
                            //           ))
                            //           : Text(''),
                            //       // (listdata1[0]
                            //       //             .insta
                            //       //             .toString() !=
                            //       //         '')
                            //       //     ? SizedBox(
                            //       //         width: 30,
                            //       //       )
                            //       //     : Text(''),
                            //       (listdata1[0]
                            //           .insta
                            //           .toString() !=
                            //           '')
                            //           ? Material(
                            //         // needed
                            //         color: Colors
                            //             .transparent,
                            //         child: InkWell(
                            //           onTap: () async {
                            //             var url =
                            //             listdata1[0]
                            //                 .insta
                            //                 .toString();
                            //             if (await canLaunch(
                            //                 url)) {
                            //               await launch(
                            //                   url);
                            //             } else {
                            //               throw 'Could not launch $url';
                            //             }
                            //           }, // ned
                            //           child: Image.asset(
                            //             "assects/instalogo.png",
                            //             height: 60,
                            //             width: 60,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //       )
                            //           : Text(''),
                            //       // (listdata1[0]
                            //       //             .youtube
                            //       //             .toString() !=
                            //       //         '')
                            //       //     ? SizedBox(
                            //       //         width: 30,
                            //       //       )
                            //       //     : Text(''),
                            //       (listdata1[0]
                            //           .youtube
                            //           .toString() !=
                            //           '')
                            //           ? Material(
                            //         // needed
                            //         color: Colors
                            //             .transparent,
                            //         child: InkWell(
                            //           onTap: () async {
                            //             var url =
                            //             listdata1[0]
                            //                 .youtube
                            //                 .toString();
                            //             js.context
                            //                 .callMethod(
                            //                 'open',
                            //                 [url]);
                            //             // if (await canLaunch(url)) {
                            //             //   await launch(url);
                            //             // } else {
                            //             //   throw 'Could not launch $url';
                            //             // }
                            //           }, // needed
                            //           child: Image.asset(
                            //             "assects/youtubelogo.png",
                            //             height: 60,
                            //             width: 60,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //       )
                            //           : Text(''),
                            //       (listdata1[0]
                            //           .linkedin
                            //           .toString() !=
                            //           '')
                            //           ? Container(
                            //           height: 60,
                            //           width: 60,
                            //           child: Material(
                            //             // needed
                            //             color: Colors
                            //                 .transparent,
                            //             child: InkWell(
                            //               onTap: () async {
                            //                 var url = listdata1[
                            //                 0]
                            //                     .linkedin
                            //                     .toString();
                            //                 js.context
                            //                     .callMethod(
                            //                     'open',
                            //                     [url]);
                            //                 // if (await canLaunch(url)) {
                            //                 //   await launch(url);
                            //                 // } else {
                            //                 //   throw 'Could not launch $url';
                            //                 // }
                            //               },
                            //               child:
                            //               Image.asset(
                            //                 "assects/linkedinlogo.png",
                            //                 height: 60,
                            //                 width: 60,
                            //                 fit: BoxFit
                            //                     .cover,
                            //               ),
                            //             ),
                            //           ))
                            //           : Text(''),
                            //       // (listdata1[0]
                            //       //             .twitter
                            //       //             .toString() !=
                            //       //         '')
                            //       //     ? SizedBox(
                            //       //         width: 30,
                            //       //       )
                            //       //     : Text(''),
                            //       (listdata1[0]
                            //           .twitter
                            //           .toString() !=
                            //           '')
                            //           ? Container(
                            //           height: 60,
                            //           width: 60,
                            //           child: Material(
                            //             // needed
                            //             color: Colors
                            //                 .transparent,
                            //             child: InkWell(
                            //               onTap: () async {
                            //                 // url_launcher: ^6.2.1
                            //
                            //                 // _launchURL(listdata1[0].facebook.toString());
                            //
                            //                 var url =
                            //                 listdata1[0]
                            //                     .twitter
                            //                     .toString();
                            //                 js.context
                            //                     .callMethod(
                            //                     'open',
                            //                     [url]);
                            //                 // if (await canLaunch(url)) {
                            //                 //   await launch(url);
                            //                 // } else {
                            //                 //   throw 'Could not launch $url';
                            //                 // }
                            //               }, // needed
                            //               child:
                            //               Image.asset(
                            //                 "assects/twitterlogo.png",
                            //                 height: 60,
                            //                 width: 60,
                            //                 fit: BoxFit
                            //                     .cover,
                            //               ),
                            //             ),
                            //           ))
                            //           : Text(''),
                            //       // (listdata1[0]
                            //       //             .telegram
                            //       //             .toString() !=
                            //       //         '')
                            //       //     ? SizedBox(
                            //       //         width: 30,
                            //       //       )
                            //       //     : Text(''),
                            //       (listdata1[0]
                            //           .telegram
                            //           .toString() !=
                            //           '')
                            //           ? Material(
                            //         // needed
                            //         color: Colors
                            //             .transparent,
                            //         child: InkWell(
                            //           onTap: () async {
                            //             var url =
                            //             listdata1[0]
                            //                 .telegram
                            //                 .toString();
                            //             js.context
                            //                 .callMethod(
                            //                 'open',
                            //                 [url]);
                            //             // if (await canLaunch(url)) {
                            //             //   await launch(url);
                            //             // } else {
                            //             //   throw 'Could not launch $url';
                            //             // }
                            //           }, // ned
                            //           child: Image.asset(
                            //             "assects/telegramlogo.png",
                            //             height: 60,
                            //             width: 60,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //       )
                            //           : Text(''),
                            //     ],
                            //   ),
                            //
                            //   // Padding(
                            //   //     padding: EdgeInsets.fromLTRB(
                            //   //         20, 10, 0, 0),
                            //   //     child: Row(
                            //   //         mainAxisAlignment:
                            //   //             MainAxisAlignment.start,
                            //   //         crossAxisAlignment:
                            //   //             CrossAxisAlignment
                            //   //                 .start,
                            //   //         children: <Widget>[
                            //   //           (listdata1[0]
                            //   //                       .whatsapp
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Container(
                            //   //                   height: 60,
                            //   //                   width: 60,
                            //   //                   child: Material(
                            //   //                     // needed
                            //   //                     color: Colors
                            //   //                         .transparent,
                            //   //                     child: InkWell(
                            //   //                       onTap:
                            //   //                           () async {
                            //   //                         // listdata1[0].whatsapp.toString()
                            //   //
                            //   //                         var contact = listdata1[
                            //   //                                 0]
                            //   //                             .whatsapp
                            //   //                             .toString();
                            //   //                         var androidUrl =
                            //   //                             "whatsapp://send?phone=$contact&text=Hi, I need some help";
                            //   //                         var iosUrl =
                            //   //                             "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
                            //   //                         js.context
                            //   //                             .callMethod(
                            //   //                                 'open',
                            //   //                                 [
                            //   //                               iosUrl
                            //   //                             ]);
                            //   //                         // if (await canLaunch(iosUrl)) {
                            //   //                         //   await launch(iosUrl, forceWebView: true, enableJavaScript: true);
                            //   //                         // } else {
                            //   //                         //   throw 'Could not launch $iosUrl';
                            //   //                         // }
                            //   //                       }, // needed
                            //   //                       child: Image
                            //   //                           .asset(
                            //   //                         "assets/images/whatsapplogo.png",
                            //   //                         height: 60,
                            //   //                         width: 60,
                            //   //                         fit: BoxFit
                            //   //                             .cover,
                            //   //                       ),
                            //   //                     ),
                            //   //                   ))
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .facebook
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? SizedBox(
                            //   //                   width: 30,
                            //   //                 )
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .facebook
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Container(
                            //   //                   height: 60,
                            //   //                   width: 60,
                            //   //                   child: Material(
                            //   //                     // needed
                            //   //                     color: Colors
                            //   //                         .transparent,
                            //   //                     child: InkWell(
                            //   //                       onTap:
                            //   //                           () async {
                            //   //                         // url_launcher: ^6.2.1
                            //   //
                            //   //                         // _launchURL(listdata1[0].facebook.toString());
                            //   //
                            //   //                         var url = listdata1[
                            //   //                                 0]
                            //   //                             .facebook
                            //   //                             .toString();
                            //   //                         js.context
                            //   //                             .callMethod(
                            //   //                                 'open',
                            //   //                                 [
                            //   //                               url
                            //   //                             ]);
                            //   //                         // if (await canLaunch(url)) {
                            //   //                         //   await launch(url);
                            //   //                         // } else {
                            //   //                         //   throw 'Could not launch $url';
                            //   //                         // }
                            //   //                       }, // needed
                            //   //                       child: Image
                            //   //                           .asset(
                            //   //                         "assets/images/fblogo2.png",
                            //   //                         height: 60,
                            //   //                         width: 60,
                            //   //                         fit: BoxFit
                            //   //                             .cover,
                            //   //                       ),
                            //   //                     ),
                            //   //                   ))
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .insta
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? SizedBox(
                            //   //                   width: 30,
                            //   //                 )
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .insta
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Material(
                            //   //                   // needed
                            //   //                   color: Colors
                            //   //                       .transparent,
                            //   //                   child: InkWell(
                            //   //                     onTap:
                            //   //                         () async {
                            //   //                       var url =
                            //   //                           listdata1[
                            //   //                                   0]
                            //   //                               .insta
                            //   //                               .toString();
                            //   //                       if (await canLaunch(
                            //   //                           url)) {
                            //   //                         await launch(
                            //   //                             url);
                            //   //                       } else {
                            //   //                         throw 'Could not launch $url';
                            //   //                       }
                            //   //                     }, // ned
                            //   //                     child:
                            //   //                         Image.asset(
                            //   //                       "assets/images/instalogo.png",
                            //   //                       height: 60,
                            //   //                       width: 60,
                            //   //                       fit: BoxFit
                            //   //                           .cover,
                            //   //                     ),
                            //   //                   ),
                            //   //                 )
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .youtube
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ?
                            //   //           SizedBox(
                            //   //                   width: 30,
                            //   //                 )
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .youtube
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Material(
                            //   //                   // needed
                            //   //                   color: Colors
                            //   //                       .transparent,
                            //   //                   child: InkWell(
                            //   //                     onTap:
                            //   //                         () async {
                            //   //                       var url = listdata1[
                            //   //                               0]
                            //   //                           .youtube
                            //   //                           .toString();
                            //   //                       js.context
                            //   //                           .callMethod(
                            //   //                               'open',
                            //   //                               [
                            //   //                             url
                            //   //                           ]);
                            //   //                       // if (await canLaunch(url)) {
                            //   //                       //   await launch(url);
                            //   //                       // } else {
                            //   //                       //   throw 'Could not launch $url';
                            //   //                       // }
                            //   //                     }, // needed
                            //   //                     child:
                            //   //                         Image.asset(
                            //   //                       "assets/images/youtubelogo.png",
                            //   //                       height: 60,
                            //   //                       width: 60,
                            //   //                       fit: BoxFit
                            //   //                           .cover,
                            //   //                     ),
                            //   //                   ),
                            //   //                 )
                            //   //               : Text(''),
                            //   //         ])),
                            //   // Padding(
                            //   //     padding: EdgeInsets.fromLTRB(
                            //   //         20, 10, 0, 0),
                            //   //     child: Row(
                            //   //         mainAxisAlignment:
                            //   //             MainAxisAlignment.start,
                            //   //         crossAxisAlignment:
                            //   //             CrossAxisAlignment
                            //   //                 .start,
                            //   //         children: <Widget>[
                            //   //           (listdata1[0]
                            //   //                       .linkedin
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Container(
                            //   //                   height: 60,
                            //   //                   width: 60,
                            //   //                   child: Material(
                            //   //                     // needed
                            //   //                     color: Colors
                            //   //                         .transparent,
                            //   //                     child: InkWell(
                            //   //                       onTap:
                            //   //                           () async {
                            //   //                         var url = listdata1[
                            //   //                                 0]
                            //   //                             .linkedin
                            //   //                             .toString();
                            //   //                         js.context
                            //   //                             .callMethod(
                            //   //                                 'open',
                            //   //                                 [
                            //   //                               url
                            //   //                             ]);
                            //   //                         // if (await canLaunch(url)) {
                            //   //                         //   await launch(url);
                            //   //                         // } else {
                            //   //                         //   throw 'Could not launch $url';
                            //   //                         // }
                            //   //                       },
                            //   //                       child: Image
                            //   //                           .asset(
                            //   //                         "assets/images/linkedinlogo.png",
                            //   //                         height: 60,
                            //   //                         width: 60,
                            //   //                         fit: BoxFit
                            //   //                             .cover,
                            //   //                       ),
                            //   //                     ),
                            //   //                   ))
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .twitter
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? SizedBox(
                            //   //                   width: 30,
                            //   //                 )
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .twitter
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Container(
                            //   //                   height: 60,
                            //   //                   width: 60,
                            //   //                   child: Material(
                            //   //                     // needed
                            //   //                     color: Colors
                            //   //                         .transparent,
                            //   //                     child: InkWell(
                            //   //                       onTap:
                            //   //                           () async {
                            //   //                         // url_launcher: ^6.2.1
                            //   //
                            //   //                         // _launchURL(listdata1[0].facebook.toString());
                            //   //
                            //   //                         var url = listdata1[
                            //   //                                 0]
                            //   //                             .twitter
                            //   //                             .toString();
                            //   //                         js.context
                            //   //                             .callMethod(
                            //   //                                 'open',
                            //   //                                 [
                            //   //                               url
                            //   //                             ]);
                            //   //                         // if (await canLaunch(url)) {
                            //   //                         //   await launch(url);
                            //   //                         // } else {
                            //   //                         //   throw 'Could not launch $url';
                            //   //                         // }
                            //   //                       }, // needed
                            //   //                       child: Image
                            //   //                           .asset(
                            //   //                         "assets/images/twitterlogo.png",
                            //   //                         height: 60,
                            //   //                         width: 60,
                            //   //                         fit: BoxFit
                            //   //                             .cover,
                            //   //                       ),
                            //   //                     ),
                            //   //                   ))
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .telegram
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? SizedBox(
                            //   //                   width: 30,
                            //   //                 )
                            //   //               : Text(''),
                            //   //           (listdata1[0]
                            //   //                       .telegram
                            //   //                       .toString() !=
                            //   //                   '')
                            //   //               ? Material(
                            //   //                   // needed
                            //   //                   color: Colors
                            //   //                       .transparent,
                            //   //                   child: InkWell(
                            //   //                     onTap:
                            //   //                         () async {
                            //   //                       var url = listdata1[
                            //   //                               0]
                            //   //                           .telegram
                            //   //                           .toString();
                            //   //                       js.context
                            //   //                           .callMethod(
                            //   //                               'open',
                            //   //                               [
                            //   //                             url
                            //   //                           ]);
                            //   //                       // if (await canLaunch(url)) {
                            //   //                       //   await launch(url);
                            //   //                       // } else {
                            //   //                       //   throw 'Could not launch $url';
                            //   //                       // }
                            //   //                     }, // ned
                            //   //                     child:
                            //   //                         Image.asset(
                            //   //                       "assets/images/telegramlogo.png",
                            //   //                       height: 60,
                            //   //                       width: 60,
                            //   //                       fit: BoxFit
                            //   //                           .cover,
                            //   //                     ),
                            //   //                   ),
                            //   //                 )
                            //   //               : Text(''),
                            //   //         ])),
                            // ),
                            // Padding(
                            //     padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            //     child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: <Widget>[
                            //           (listdata1[0].whatsapp.toString() != '0')
                            //             ? SizedBox(
                            //           width: 1,
                            //         )
                            //             : Text(''),
                            //           (listdata1[0].whatsapp.toString() != '0')
                            //               ? Container(
                            //                   height: 60,
                            //                   width: 60,
                            //                   child: Material(
                            //                     // needed
                            //                     color: Colors.transparent,
                            //                     child: InkWell(
                            //                       onTap: () async {
                            //                         var contact = listdata1[0]
                            //                             .whatsapp
                            //                             .toString();
                            //                         var androidUrl =
                            //                             "whatsapp://send?phone=$contact&text=Hi";
                            //                         var iosUrl =
                            //                             "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
                            //
                            //                         js.context.callMethod('open', [iosUrl]);
                            //                       }, // needed
                            //                       child: Image.asset(
                            //                         "assects/whatsapplogo.png",
                            //                         height: 60,
                            //                         width: 60,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //                     ),
                            //                   ))
                            //               : Text(''),
                            //           (listdata1[0].facebook.toString() != '')
                            //               ? SizedBox(
                            //                   width: 30,
                            //                 )
                            //               : Text(''),
                            //           (listdata1[0].facebook.toString() != '')
                            //               ? Container(
                            //                   height: 60,
                            //                   width: 60,
                            //                   child: Material(
                            //                     // needed
                            //                     color: Colors.transparent,
                            //                     child: InkWell(
                            //                       onTap: () async {
                            //                         // url_launcher: ^6.2.1
                            //
                            //                         // _launchURL(listdata1[0].facebook.toString());
                            //
                            //                         var url = listdata1[0]
                            //                             .facebook
                            //                             .toString();
                            //                         js.context.callMethod(
                            //                             'open', [url]);
                            //                       }, // needed
                            //                       child: Image.asset(
                            //                         "assects/fblogo2.png",
                            //                         height: 60,
                            //                         width: 60,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //                     ),
                            //                   ))
                            //               : Text(''),
                            //           (listdata1[0].insta.toString() != '')
                            //               ? SizedBox(
                            //                   width: 30,
                            //                 )
                            //               : Text(''),
                            //           (listdata1[0].insta.toString() != '')
                            //               ? Material(
                            //                   // needed
                            //                   color: Colors.transparent,
                            //                   child: InkWell(
                            //                     onTap: () async {
                            //                       var url = listdata1[0]
                            //                           .insta
                            //                           .toString();
                            //                       js.context.callMethod(
                            //                           'open', [url]);
                            //                     }, // ned
                            //                     child: Image.asset(
                            //                       "assects/instalogo.png",
                            //                       height: 60,
                            //                       width: 60,
                            //                       fit: BoxFit.cover,
                            //                     ),
                            //                   ),
                            //                 )
                            //               : Text(''),
                            //           (listdata1[0].youtube.toString() != '')
                            //               ? SizedBox(
                            //                   width: 30,
                            //                 )
                            //               : Text(''),
                            //           (listdata1[0].youtube.toString() != '')
                            //               ? Material(
                            //                   // needed
                            //                   color: Colors.transparent,
                            //                   child: InkWell(
                            //                     onTap: () async {
                            //                       var url = listdata1[0]
                            //                           .youtube
                            //                           .toString();
                            //                       js.context.callMethod(
                            //                           'open', [url]);
                            //                     }, // needed
                            //                     child: Image.asset(
                            //                       "assects/youtubelogo.png",
                            //                       height: 60,
                            //                       width: 60,
                            //                       fit: BoxFit.cover,
                            //                     ),
                            //                   ),
                            //                 )
                            //               : Text(''),
                            //         ])),
                            // Padding(
                            //     padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            //     child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment:
                            //             CrossAxisAlignment.start,
                            //         children: <Widget>[
                            //           (listdata1[0].linkedin.toString() != '')
                            //               ? Container(
                            //                   height: 60,
                            //                   width: 60,
                            //                   child: Material(
                            //                     // needed
                            //                     color: Colors.transparent,
                            //                     child: InkWell(
                            //                       onTap: () async {
                            //                         var url = listdata1[0]
                            //                             .linkedin
                            //                             .toString();
                            //                         js.context.callMethod(
                            //                             'open', [url]);
                            //                       },
                            //                       child: Image.asset(
                            //                         "assects/linkedinlogo.png",
                            //                         height: 60,
                            //                         width: 60,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //                     ),
                            //                   ))
                            //               : Text(''),
                            //           (listdata1[0].twitter.toString() != '')
                            //               ? SizedBox(
                            //                   width: 30,
                            //                 )
                            //               : Text(''),
                            //           (listdata1[0].twitter.toString() != '')
                            //               ? Container(
                            //                   height: 60,
                            //                   width: 60,
                            //                   child: Material(
                            //                     // needed
                            //                     color: Colors.transparent,
                            //                     child: InkWell(
                            //                       onTap: () async {
                            //                         // url_launcher: ^6.2.1
                            //
                            //                         // _launchURL(listdata1[0].facebook.toString());
                            //
                            //                         var url = listdata1[0]
                            //                             .twitter
                            //                             .toString();
                            //                         js.context.callMethod(
                            //                             'open', [url]);
                            //                       }, // needed
                            //                       child: Image.asset(
                            //                         "assects/twitterlogo.png",
                            //                         height: 60,
                            //                         width: 60,
                            //                         fit: BoxFit.cover,
                            //                       ),
                            //                     ),
                            //                   ))
                            //               : Text(''),
                            //           (listdata1[0].telegram.toString() != '')
                            //               ? SizedBox(
                            //                   width: 30,
                            //                 )
                            //               : Text(''),
                            //           (listdata1[0].telegram.toString() != '')
                            //               ? Material(
                            //                   // needed
                            //                   color: Colors.transparent,
                            //                   child: InkWell(
                            //                     onTap: () async {
                            //                       var url = listdata1[0]
                            //                           .telegram
                            //                           .toString();
                            //                       js.context.callMethod(
                            //                           'open', [url]);
                            //                     },
                            //                     child: Image.asset(
                            //                       "assects/telegramlogo.png",
                            //                       height: 60,
                            //                       width: 60,
                            //                       fit: BoxFit.cover,
                            //                     ),
                            //                   ),
                            //                 )
                            //               : Text(''),
                            //         ])),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        color: Color(0xffE9E9E9),
                                        child: Center(
                                          child: Text(
                                            'EASY TOUCH',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ])),
                            SizedBox(
                              width: 15,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(25, 5, 40, 5),
                                child: Stack(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Card(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 0, 0),
                                                      child: Text('  Call at :',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.yellow,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  if (listdata1[0]
                                                          .phone
                                                          .toString() !=
                                                      'null')
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                50, 5, 0, 0),
                                                        child: Material(
                                                          // needed
                                                          color: Colors.grey,
                                                          child: InkWell(
                                                              onTap: () async {
                                                                String
                                                                    phoneNumber =
                                                                    listdata1[0]
                                                                        .phone
                                                                        .toString();
                                                                js.context
                                                                    .callMethod(
                                                                        'eval',
                                                                        [
                                                                      'window.location.href = "tel:$phoneNumber"'
                                                                    ]);
                                                              },
                                                              child: Text(
                                                                  listdata1[0]
                                                                      .phone
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.width *
                                                                              .05,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                        )),
                                                  if (listdata1[0]
                                                          .mobile
                                                          .toString() !=
                                                      'null')
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                50, 5, 0, 0),
                                                        child: Material(
                                                          // needed
                                                          color: Colors.grey,
                                                          child: InkWell(
                                                              onTap: () async {
                                                                String
                                                                    phoneNumber =
                                                                    listdata1[0]
                                                                        .mobile
                                                                        .toString();
                                                                js.context
                                                                    .callMethod(
                                                                        'eval',
                                                                        [
                                                                      'window.location.href = "tel:$phoneNumber"'
                                                                    ]);
                                                              },
                                                              child: Text(
                                                                  listdata1[0]
                                                                      .mobile
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.width *
                                                                              .05,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                        ))
                                                ]),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ]),
                                  FractionalTranslation(
                                      translation: Offset(0.5, 0.5),
                                      child: Align(
                                          // alignment: Alignment.,
                                          child: SizedBox(
                                        child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.wifi_calling_3_outlined,
                                                  color: Colors.black,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .08,
                                                ),
                                            //   ),
                                            // )
                                          ),
                                      ))),
                                ])),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 5, 40, 5),
                              child: Stack(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Card(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            20, 5, 0, 0),
                                                    child: Text('  Mail at :',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.yellow,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .05,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                if (listdata1[0]
                                                        .email
                                                        .toString() !=
                                                    'null')
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              25, 5, 25, 0),
                                                      child: Material(
                                                        // needed
                                                        color:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                            onTap: () async {
                                                              String emailUrl =
                                                                  "mailto:" +
                                                                      listdata1[
                                                                              0]
                                                                          .email
                                                                          .toString();
                                                              js.context
                                                                  .callMethod(
                                                                      'open', [
                                                                emailUrl
                                                              ]);
                                                            },
                                                            child: Text(
                                                                listdata1[0]
                                                                    .email
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .05,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                      )),
                                                if (listdata1[0]
                                                        .email1
                                                        .toString() !=
                                                    'null')
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              25, 5, 25, 0),
                                                      child: Material(
                                                          // needed
                                                          color: Colors
                                                              .transparent,
                                                          child: InkWell(
                                                              onTap: () async {
                                                                String
                                                                    emailUrl =
                                                                    "mailto:" +
                                                                        listdata1[0]
                                                                            .email1
                                                                            .toString();
                                                                js.context
                                                                    .callMethod(
                                                                        'open',
                                                                        [
                                                                      emailUrl
                                                                    ]);
                                                              },
                                                              child: Text(
                                                                  listdata1[0]
                                                                      .email1
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.width *
                                                                              .05,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))))),
                                              ]),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                                FractionalTranslation(
                                    translation: Offset(0.5, 0.5),
                                    child: Align(
                                      // alignment: Alignment.,
                                      child: SizedBox(
                                        child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                            backgroundColor: Colors.white,
                                            // child: Material(
                                            //   // needed
                                            //   color: Colors.transparent,
                                            //   child: InkWell(
                                            //     onTap: () async {
                                            //       String emailUrl = "mailto:" +
                                            //           listdata1[0]
                                            //               .email
                                            //               .toString();
                                            //       js.context.callMethod(
                                            //           'open', [emailUrl]);
                                            //     },
                                                child: Icon(
                                                  Icons.mail_outline_rounded,
                                                  color: Colors.black,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .08,
                                                ), // ned
                                            //  ),
                                           // )
                                           ),
                                      ),
                                    ))
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 5, 40, 5),
                              child: Stack(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Card(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            20, 5, 0, 0),
                                                    child: Text('  Website :',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.yellow,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .05,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                if (listdata1[0]
                                                        .website
                                                        .toString() !=
                                                    'null')
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              25, 5, 25, 0),
                                                      child: Material(
                                                        // needed
                                                        color:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                            onTap: () async {
                                                              var url =
                                                                  listdata1[0]
                                                                      .website
                                                                      .toString();
                                                              js.context
                                                                  .callMethod(
                                                                      'open',
                                                                      [url]);
                                                            },
                                                            child: Text(
                                                                listdata1[0]
                                                                    .website
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        .05,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                      ))
                                              ]),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          color: Colors.grey,
                                        ),
                                      )
                                    ]),
                                FractionalTranslation(
                                    translation: Offset(0.5, 0.5),
                                    child: Align(
                                      // alignment: Alignment.,
                                      child: SizedBox(
                                        child: CircleAvatar(
                                          // radius: 30.0,
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .08,
                                          backgroundColor: Colors.white,
                                          // child: Material(
                                          //   // needed
                                          //   color: Colors.transparent,
                                          //   child: InkWell(
                                          //     onTap: () async {
                                          //       var url = listdata1[0].website
                                          //           .toString();
                                          //       js.context.callMethod('open', [url]);
                                          //     },
                                          child: Icon(
                                            CupertinoIcons.globe,
                                            color: Colors.black,
                                            // size: 40.0,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .08,
                                          ),
                                        ),
                                      ),
                                      //  ))
                                    ))
                              ]),
                            ),
                           Padding(
                                padding: EdgeInsets.fromLTRB(25, 5, 40, 5),
                                child: Stack(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Card(
                                            child:  SingleChildScrollView(child:Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              20, 5, 0, 0),
                                                      child: Text('  Address :',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.yellow,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  if (listdata1[0]
                                                          .address
                                                          .toString() !=
                                                      'null')
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                25, 5, 25, 0),
                                                        child: Material(
                                                          // needed
                                                          color:
                                                          Colors.transparent,
                                                          child: InkWell(
                                                              onTap: () async {
                                                                var url =
                                                                listdata1[0]
                                                                    .google_map_link
                                                                    .toString();
                                                                js.context
                                                                    .callMethod(
                                                                    'open',
                                                                    [url]);
                                                              },
                                                              child: Text(
                                                                  listdata1[0]
                                                                      .address
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize: MediaQuery.of(context)
                                                                          .size
                                                                          .width *
                                                                          .05,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                        ))
                                                ])),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            color: Colors.grey,
                                          ),
                                        )
                                      ]),
                                  FractionalTranslation(
                                      translation: Offset(0.5, 0.8),
                                      child: Align(
                                          // alignment: Alignment.,
                                          child: SizedBox(
                                              child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                .08,
                                        backgroundColor: Colors.white,
                                                child: Material(
                                                    // needed
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      // onTap: () async {
                                                      //   final Uri url = Uri.parse(listdata1[0].google_map_link.toString());
                                                      //   if (!await launchUrl(url)) {
                                                      //     throw Exception('Could not launch');
                                                      //   }
                                                      //   print('link:'+listdata1[0].google_map_link.toString());
                                                      // },
                                            child: Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.black,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .08,
                                            ),
                                          ),
                                        ),
                                      ))))
                                ])),
                            SizedBox(
                              height: 20,
                            ),
                            (listdata1[0].qrcodeimg.toString() != '')
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                        Container(
                                          color: Color(0xffE9E9E9),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 5, 20, 0),
                                              child: Text(
                                                '    YOU CAN ALSO PAY'
                                                '\n USING YOUR UPI APPS',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ])
                                : Text(''),
                            (listdata1[0].qrcodeimg.toString() != '')
                                ? SizedBox(
                                    height: 20,
                                  )
                                : Text(''),
                            (listdata1[0].qrcodeimg.toString() != '')
                                ? Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            color: Color(0xffE9E9E9),
                                            child: Image.network(
                                              listdata1[0].qrcodeimg.toString(),
                                              // 'assects/QR Code.jpeg',
                                              // height: MediaQuery.of(context).size.height/2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                            ),
                                          ),
                                        ]))
                                : Text(''),
                            (listdata1[0].qrcodeimg.toString() != '')
                                ? SizedBox(
                                    height: 20,
                                  )
                                : Text(''),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    // height: MediaQuery.of(context).size.height/8,
                                    // width: MediaQuery.of(context).size.width/1,
                                    color: Color(0xffE9E9E9),
                                    child: Center(
                                      child: Text(
                                        'GALLERY',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            backgroundColor:
                                                Colors.green.shade900),
                                      ),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 15,
                            ),
                            FutureBuilder(
                                future: multiple_Future,
                                builder: (context, snapshot) {
                                  return snapshot.hasData
                                      ? Padding(
                                          padding: EdgeInsets.all(20),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: multiplelist.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                                  childAspectRatio: MediaQuery.of(context).size.width /
                                                      (MediaQuery.of(context).size.height / 1.3),
                                              crossAxisSpacing:
                                                  12,
                                              // mainAxisSpacing:
                                              //   6,
                                            ),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Center(
                                                  child: Wrap(
                                                spacing: 30,
                                                direction: Axis.horizontal,
                                                children: [
                                                  Image.network(
                                                    multiplelist[index]
                                                        .image
                                                        .toString(),
                                                    width: 150,
                                                    height: 150,
                                                  ),
                                                ],
                                              ));
                                            },
                                          ))
                                      : Text('');
                                }),
                            // Padding(
                            //     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            //     child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.start,
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: <Widget>[
                            //
                            //           Container(
                            //             color: Color(0xffE9E9E9),
                            //             child: Image.asset(
                            //               'assects/photo.jpeg',
                            //               height: MediaQuery
                            //                   .of(context)
                            //                   .size
                            //                   .height / 8,
                            //               width: MediaQuery
                            //                   .of(context)
                            //                   .size
                            //                   .width / 4,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 25,
                            //           ),
                            //           Column(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //               crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //               children: <Widget>[
                            //                 SizedBox(
                            //                   width: 35,
                            //                 ),
                            //                 Container(
                            //                   color: Color(0xffE9E9E9),
                            //                   child: Image.asset(
                            //                     'assects/photo1.jpeg',
                            //                     height: MediaQuery
                            //                         .of(context)
                            //                         .size
                            //                         .height / 8,
                            //                     width: MediaQuery
                            //                         .of(context)
                            //                         .size
                            //                         .width / 4,
                            //                   ),
                            //                 ),
                            //               ]),
                            //           SizedBox(
                            //             width: 15,
                            //           ),
                            //           Column(
                            //               mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //               crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //               children: <Widget>[
                            //                 SizedBox(
                            //                   width: 35,
                            //                 ),
                            //                 Container(
                            //                   color: Color(0xffE9E9E9),
                            //                   child: Image.asset(
                            //                     'assects/photo2.jpeg',
                            //                     height: MediaQuery
                            //                         .of(context)
                            //                         .size
                            //                         .height / 8,
                            //                     width: MediaQuery
                            //                         .of(context)
                            //                         .size
                            //                         .width / 4,
                            //                   ),
                            //                 ),
                            //               ]),
                            //         ])),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: <Widget>[
                            //     SizedBox(
                            //       width: 150,
                            //     ),
                            //     Container(
                            //       color: Color(0xffE9E9E9),
                            //       child: Image.asset(
                            //         'assects/photo3.jpeg',
                            //         height: MediaQuery
                            //             .of(context)
                            //             .size
                            //             .height / 8,
                            //         width: MediaQuery
                            //             .of(context)
                            //             .size
                            //             .width / 4,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width,
                                      color: Color(0xff007356),
                                      child: Center(
                                        child: Text(
                                          '  DOWNLOAD OUR BROUCHER ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ]),
                            Container(
                                height: MediaQuery.of(context).size.height / 9,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xff007356),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                9,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8,
                                            color: Color(0xff007356),
                                            child: CircleAvatar(
                                              radius: 35.0,
                                              backgroundColor: Colors.yellow,
                                              child: Icon(
                                                Icons.download_outlined,
                                                color: Colors.green,
                                              ),
                                            ),
                                          )),
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              9,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.3,
                                          color: Color(0xff007356),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0), // Background color
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    var url = listdata1[0]
                                                        .pdf
                                                        .toString();
                                                    js.context.callMethod(
                                                        'open', [url]);
                                                  },
                                                  child: Text(
                                                    ' -> DOWNLOAD  NOW',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      backgroundColor:
                                                          Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ]))
                                    ])),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Powered by FUTURE INFOTECH",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Container(
                            //   color: Color(0xffE9E9E9),
                            //   child: Image.asset(
                            //     'assects/etouchlogo1.jpeg',
                            //     height: MediaQuery
                            //         .of(context)
                            //         .size
                            //         .height / 9,
                            //     width: MediaQuery
                            //         .of(context)
                            //         .size
                            //         .width,
                            //   ),
                            // ),
                          ],
                        ),
                        Positioned(
                          top: 130.0,
                          child: CircleAvatar(
                            radius: 70.0,
                            backgroundColor: Color(0xffFEBE16),
                            backgroundImage: NetworkImage(
                              listdata1[0].profileimg.toString(),
                            ),
                          ),
                        ),
                      ]),
                    )
                  : CircularProgressIndicator();
            }),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                width: 400,
                height:45,
                color: Color(0xffE9E9E9),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff007356),
                  ),
                  onPressed: () async {
                    var vCard = VCard();

                    final vCardContent = '''BEGIN:VCARD
VERSION:3.0
FN:${listdata1[0].cusname.toString() ?? ''}
ORG:${listdata1[0].companyname.toString() ?? ''}
TEL;TYPE=WORK,VOICE:${listdata1[0].phone.toString() ?? ''}
TEL;TYPE=HOME,VOICE:${listdata1[0].mobile.toString() ?? ''}
EMAIL:${listdata1[0].email.toString() ?? ''}
END:VCARD''';

                    final encodedContent = utf8.encode(vCardContent);

                    final blob =
                    html.Blob([encodedContent], 'text/vcard');

                    final url = html.Url.createObjectUrlFromBlob(blob);

                    final anchor = html.AnchorElement(href: url)
                      ..setAttribute('download',
                          '${listdata1[0].cusname.toString() ?? ''}.vcf')
                      ..click();

                    html.Url.revokeObjectUrl(url);

                    /// Save to file
                    // vCard.saveToFile('./contact.vcf');

                    /// Get as formatted string
                    print(vCard.getFormattedString());

                    // final card = VCard1.fromPlainText(vcard1Text);
                    // final directory = await getApplicationDocumentsDirectory();
                    // final path = directory.path;
                    // var pathAsText = "$path/contacts.txt";
                    //
                    // var contactAsFile = File(await getFilePath(index.toString()));
                    // contactAsFile.writeAsString(vcard1Text);
                    //
                    // var vcf = contactAsFile
                    //     .renameSync(contactAsFile.path.replaceAll(".txt", ".vcf"));
                    // debugPrint(card.toString());
                    // debugPrint(card.toPlainText());
                    // var url = "tel://" + listdata1[0].phone.toString();
                    // js.context.callMethod('open', [url]);

//                           final vCard = VCard(
//
//                             // Set vCard properties
//                             // firstName: 'John',
//                             // lastName: 'Doe',
//                             // emailAddresses: [EmailAddress(value: 'john.doe@example.com')],
//                             // phoneNumbers: [PhoneNumber(value: '+1234567890')],
//                           );
//
// // Encode vCard data to a byte string
//                           final vCardData = vCard.encode();
                  },
                  icon: Icon(
                    CupertinoIcons.person_crop_circle,
                    size: 27.0,
                  ),
                  label: Text(
                    'ADD TO CONTACT',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                )
              //))
            )
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xff007356),
//               ),
//               onPressed: () async {
//                 var vCard = VCard();
//
//
//                 final vCardContent = '''BEGIN:VCARD
// VERSION:3.0
// FN:${listdata1[0].cusname.toString() ?? ''}
// ORG:${ listdata1[0].companyname.toString() ?? ''}
// TEL;TYPE=WORK,VOICE:${listdata1[0].phone.toString() ?? ''}
// TEL;TYPE=HOME,VOICE:${listdata1[0].mobile.toString() ?? ''}
// EMAIL:${ listdata1[0].email.toString() ?? ''}
// END:VCARD''';
//
//
//
//                 final encodedContent = utf8.encode(vCardContent);
//
//                 final blob =
//                 html.Blob([encodedContent], 'text/vcard');
//
//
//
//                 final url = html.Url.createObjectUrlFromBlob(blob);
//
//                 final anchor = html.AnchorElement(href: url)
//                   ..setAttribute('download', '${listdata1[0].cusname.toString() ?? ''}.vcf')
//                   ..click();
//
//                 html.Url.revokeObjectUrl(url);
//
//                 /// Save to file
//                 // vCard.saveToFile('./contact.vcf');
//
//                 /// Get as formatted string
//                 print(vCard.getFormattedString());
//               },
//               icon: Icon(
//                 Icons.person,
//                 size: 24.0,
//               ),
//               label: Text(
//                 'Add to Contact',
//               ),
//             )
        )

    // bottomNavigationBar: Padding(
    //     padding: EdgeInsets.all(8.0),
    //     child: ElevatedButton.icon(
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: Color(0xff007356),
    //       ),
    //       onPressed:
    //       () {
    //  var vCard = VCard();
    //  vCard.workPhone = listdata1[0].phone.toString();
    //  vCard.saveToFile('./contact.vcf');
    // },
    //       icon: Icon(
    //         Icons.person,
    //         size: 24.0,
    //       ),
    //       label: Text(
    //         'Add to Contact',
    //       ),
    //     ))


    );
  }
}
