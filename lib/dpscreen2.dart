import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'dart:html';
import 'dart:html' as html;
import 'package:vcard_maintained/vcard_maintained.dart';
import 'dart:js' as js;
import 'package:flutter/foundation.dart' show kIsWeb;
import'dart:io' show Platform;


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
  String office_address2;
  String google_map_link2;

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
    required this.office_address2,
    required this.google_map_link2,
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
      office_address2: json['office_address2'],
      google_map_link2: json['google_map_link2'],
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
  late Future<List> leadlist_Future;
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
    print("Aaaa" + id.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final companyid = prefs.getString('companyid') ?? '';
    final user_id = prefs.getString('user_id') ?? '';
    var url =
        Uri.parse('https://nfc.futureinfotechservices.in/profile_list2.php');
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
        office_address2: api['office_address2'],
        google_map_link2: api['google_map_link2'],
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
    leadlist_Future = leadlistdownloadJSON(context);
    print("Argument :" + id.toString());
    // var url = window.location.href;
    // print("url :" + url.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E9E9),
        body: FutureBuilder(
            future: leadlist_Future,
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
                                        softWrap: true,
                                        style: TextStyle(
                                           fontFamily: 'Verdana',
                                            color: Color(0xff007356),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),),
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
                                        listdata1[0]
                                            .companyname
                                            .toUpperCase()
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'Verdana',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ]),
                            if (listdata1[0].jobrole.toString() != '')
                              SizedBox(
                                height: 2,
                              ),
                            if (listdata1[0].jobrole.toString() != '')
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      color: Color(0xffE9E9E9),
                                      child: Center(
                                        child: Text(
                                          listdata1[0]
                                              .jobrole
                                              .capitalize()
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'Verdana',
                                            color: Colors.black,
                                            fontSize: 15,
                                            //fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            SizedBox(
                              height: 25,
                            ),
                            if (listdata1[0].aboutme.toString() != '')
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Container(
                                          color: Color(0xffE9E9E9),
                                          child: Center(
                                            child: Text(
                                              'ABOUT ME :',
                                              style: TextStyle(
                                                  fontFamily: 'Verdana',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )),
                                  ]),
                            if (listdata1[0].aboutme.toString() != '')
                              Padding(
                                  padding: EdgeInsets.fromLTRB(27, 4, 0, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .9,
                                          child: Text(
                                            listdata1[0]
                                                .aboutme
                                                .capitalize()
                                                .toString(),
                                            maxLines: null,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'Verdana',
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ])),
                            if (listdata1[0].aboutme.toString() != '')
                              SizedBox(
                                height: 16,
                              ),
                            if (listdata1[0].whatsapp.toString() != '0' ||
                                listdata1[0].facebook.toString() != '' ||
                                listdata1[0].insta.toString() != '' ||
                                listdata1[0].youtube.toString() != '' ||
                                listdata1[0].linkedin.toString() != '' ||
                                listdata1[0].twitter.toString() != '' ||
                                listdata1[0].telegram.toString() != '')
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
                                                fontFamily: 'Verdana',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                              child: Wrap(
                                //direction: Axis.vertical,
                                runSpacing: 10.0,
                                spacing: 20.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
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
                                  if (listdata1[0].whatsapp.toString() != '0')
                                    Container(
                                        height: 51,
                                        width: 50,
                                        child: Material(
                                          // needed
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var contact = listdata1[0]
                                                  .whatsapp
                                                  .toString();
                                              var androidUrl =
                                                  "whatsapp://send?phone=$contact&text=Hi";
                                              var iosUrl =
                                                  "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

                                              js.context
                                                  .callMethod('open', [iosUrl]);
                                            }, // needed
                                            child: Image.asset(
                                              "assects/whatsapplogo.png",
                                              height: 51,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                  if (listdata1[0].facebook.toString() != '')
                                    Container(
                                        height: 44,
                                        width: 50,
                                        child: Material(
                                          // needed
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = listdata1[0]
                                                  .facebook
                                                  .toString();
                                              js.context
                                                  .callMethod('open', [url]);
                                            },
                                            child: Image.asset(
                                              "assects/fblogo3.jpg",
                                              height: 44,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),

                                  if (listdata1[0].insta.toString() != '')
                                    Material(
                                      // needed
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          var url =
                                              listdata1[0].insta.toString();
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        }, // ned
                                        child: Image.asset(
                                          "assects/instalogo.png",
                                          height: 51,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  if (listdata1[0].youtube.toString() != '')
                                    Material(
                                      // needed
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () async {
                                          var url =
                                              listdata1[0].youtube.toString();
                                          js.context.callMethod('open', [url]);
                                        }, // needed
                                        child: Image.asset(
                                          "assects/youtubelogo.png",
                                          height: 51,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  if (listdata1[0].linkedin.toString() != '')
                                    Container(
                                        height: 39,
                                        width: 50,
                                        child: Material(
                                          // needed
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = listdata1[0]
                                                  .linkedin
                                                  .toString();
                                              js.context
                                                  .callMethod('open', [url]);
                                            },
                                            child: Image.asset(
                                              "assects/linkedinlogo.png",
                                              height: 39,
                                              width: 35,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),

                                  if (listdata1[0].twitter.toString() != '')
                                    Container(
                                        height: 41,
                                        width: 50,
                                        child: Material(
                                          // needed
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = listdata1[0]
                                                  .twitter
                                                  .toString();
                                              js.context
                                                  .callMethod('open', [url]);
                                            }, // needed
                                            child: Image.asset(
                                              "assects/twitterlogo.png",
                                              height: 41,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                  if (listdata1[0].telegram.toString() != '')
                                    Container(
                                        height: 50,
                                        width: 50,
                                        child: Material(
                                          // needed
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              var url = listdata1[0]
                                                  .telegram
                                                  .toString();
                                              js.context
                                                  .callMethod('open', [url]);
                                            }, // ned
                                            child: Image.asset(
                                              "assects/telegramlogo.png",
                                              height: 45,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ))
                                  //: Text(''),
                                ],
                              ),
                            ),
                            if (listdata1[0].whatsapp.toString() != '0' ||
                                listdata1[0].facebook.toString() != '' ||
                                listdata1[0].insta.toString() != '' ||
                                listdata1[0].youtube.toString() != '' ||
                                listdata1[0].linkedin.toString() != '' ||
                                listdata1[0].twitter.toString() != '' ||
                                listdata1[0].telegram.toString() != '')
                            SizedBox(
                              height: 10,
                            ),
                            if (listdata1[0].mobile.toString() != '0' ||
                                listdata1[0].phone.toString() != '0' ||
                                listdata1[0].email.toString() != '' ||
                                listdata1[0].email1.toString() != '' ||
                                listdata1[0].website.toString() != '' ||
                                listdata1[0].address.toString() != '' ||
                                listdata1[0].office_address2.toString() != '')
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          color: Color(0xffE9E9E9),
                                          child: Center(
                                            child: Text(
                                              'EASY TOUCH',
                                              style: TextStyle(
                                                  fontFamily: 'Verdana',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ])),
                            if (listdata1[0].mobile.toString() != '0' ||
                                listdata1[0].phone.toString() !=
                                    '0' ||
                                listdata1[0].email.toString() !=
                                    '' ||
                                listdata1[0].email1.toString() !=
                                    '' ||
                                listdata1[0].website.toString() !=
                                    '' ||
                                listdata1[0]
                                    .address
                                    .toString() !=
                                    '' ||
                                listdata1[0]
                                    .office_address2
                                    .toString() !=
                                    '')
                            SizedBox(
                              width: 15,
                            ),
                            if (listdata1[0].phone.toString() != '0' ||
                                listdata1[0].mobile.toString() != '0')
                              Padding(
                                  padding: EdgeInsets.fromLTRB(25, 10, 40, 5),
                                  child: Stack(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            // height: MediaQuery.of(context)
                                            //         .size
                                            //         .height /
                                            //     6,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                                        child: Text(
                                                            '  Call at :',
                                                            style: TextStyle(
                                                              fontFamily: 'Verdana',
                                                                color: Colors
                                                                    .yellow,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold
                                                            ))),
                                                    if (listdata1[0]
                                                            .phone
                                                            .toString() !=
                                                        '0')
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  50, 5, 0, 2),
                                                          child: Material(
                                                            // needed
                                                            color: Colors.grey,
                                                            child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  String
                                                                      phoneNumber =
                                                                      listdata1[
                                                                              0]
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
                                                                      fontFamily: 'Verdana',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                .04,

                                                                    ))),
                                                          )),
                                                    if (listdata1[0]
                                                            .mobile
                                                            .toString() !=
                                                        '0')
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  50, 5, 0, 0),
                                                          child: Material(
                                                            // needed
                                                            color: Colors.grey,
                                                            child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  String
                                                                      phoneNumber =
                                                                      listdata1[
                                                                              0]
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
                                                                      fontFamily: 'Verdana',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                .04,
                                                                        // fontWeight:
                                                                        //     FontWeight.bold
                                                                    ))),
                                                          )),
                                                    SizedBox(height: 10),
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
                                        translation:
                                            (listdata1[0].phone.toString() ==
                                                        '0' ||
                                                    listdata1[0]
                                                            .mobile
                                                            .toString() ==
                                                        '0')
                                                ? Offset(0.5, 0.2)
                                                : Offset(0.5, 0.5),
                                        child: Align(
                                            // alignment: Alignment.,
                                            child: SizedBox(
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .06,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.wifi_calling_3_outlined,
                                              color: Colors.black,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .06,
                                            ),
                                            //   ),
                                            // )
                                          ),
                                        ))),
                                  ])),
                            if (listdata1[0].email.toString() != '' ||
                                listdata1[0].email1.toString() != '')
                              Padding(
                                padding: EdgeInsets.fromLTRB(25, 10, 40, 5),
                                child: Stack(children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          // height:
                                          //     MediaQuery.of(context).size.height /
                                          //         6,
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
                                                            fontFamily: 'Verdana',
                                                              color:
                                                                  Colors.yellow,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold
                                                          ))),
                                                  if (listdata1[0]
                                                          .email
                                                          .toString() !=
                                                      '')
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
                                                                            .email
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
                                                                      .email
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                    fontFamily: 'Verdana',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.width *
                                                                              .04,
                                                                      // fontWeight:
                                                                      //     FontWeight
                                                                      //         .bold
                                                                  ))),
                                                        )),
                                                  if (listdata1[0]
                                                          .email1
                                                          .toString() !=
                                                      '')
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                25, 5, 25, 0),
                                                        child: Material(
                                                            // needed
                                                            color: Colors
                                                                .transparent,
                                                            child: InkWell(
                                                                onTap:
                                                                    () async {
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
                                                                      fontFamily: 'Verdana',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                .04,
                                                                        // fontWeight:
                                                                        //     FontWeight.bold
                                                                    ))))),
                                                  SizedBox(height: 10),
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
                                      translation:(listdata1[0].email1.toString() ==
                                          '' ||
                                          listdata1[0]
                                              .email
                                              .toString() ==
                                              '')
                                          ? Offset(0.5, 0.2)
                                          : Offset(0.5, 0.5),
                                       //Offset(0.5, 0.5),
                                      child: Align(
                                        // alignment: Alignment.,
                                        child: SizedBox(
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .06,
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
                                                  .06,
                                            ), // ned
                                            //  ),
                                            // )
                                          ),
                                        ),
                                      ))
                                ]),
                              ),
                            if (listdata1[0].website.toString() != '')
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
                                          // height:
                                          //     MediaQuery.of(context).size.height /
                                          //         6,
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
                                                            fontFamily: 'Verdana',
                                                              color:
                                                                  Colors.yellow,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  .04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold
                                                          ))),
                                                  if (listdata1[0]
                                                          .website
                                                          .toString() !=
                                                      '')
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
                                                                    fontFamily: 'Verdana',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.width *
                                                                              .04,
                                                                      // fontWeight:
                                                                      //     FontWeight
                                                                      //         .bold
                                                                  ))),
                                                        )),
                                                  SizedBox(height: 10),
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
                                      translation: Offset(0.5, 0.2),
                                      child: Align(
                                        // alignment: Alignment.,
                                        child: SizedBox(
                                          child: CircleAvatar(
                                            // radius: 30.0,
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .06,
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
                                                  .06,
                                            ),
                                          ),
                                        ),
                                        //  ))
                                      ))
                                ]),
                              ),
                            if (listdata1[0].address.toString() != '')
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
                                            // height: MediaQuery.of(context)
                                            //         .size
                                            //         .height /
                                            //     5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Card(
                                              child:
                                                  // SingleChildScrollView(
                                                  //     child:
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 5, 0, 0),
                                                        child: Text(
                                                            '  Address1 :',
                                                            style: TextStyle(
                                                              fontFamily: 'Verdana',
                                                                color: Colors
                                                                    .yellow,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold
                                                            ))),
                                                    if (listdata1[0]
                                                            .address
                                                            .toString() !=
                                                        '')
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  25, 5, 25, 7),
                                                          child: Material(
                                                            // needed
                                                            color: Colors
                                                                .transparent,
                                                            child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  var url = listdata1[
                                                                          0]
                                                                      .google_map_link
                                                                      .toString();
                                                                  js.context
                                                                      .callMethod(
                                                                          'open',
                                                                          [
                                                                        url
                                                                      ]);
                                                                },
                                                                child: Text(
                                                                    listdata1[0]
                                                                        .address
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                      fontFamily: 'Verdana',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                .04,
                                                                        // fontWeight:
                                                                        //     FontWeight.bold
                                                                    ))),
                                                          )),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ]),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
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
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .06,
                                          backgroundColor: Colors.white,
                                          child: Material(
                                            // needed
                                            color: Colors.transparent,
                                            child: InkWell(
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.black,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .06,
                                              ),
                                            ),
                                          ),
                                        ))))
                                  ])),
                            if (listdata1[0].office_address2.toString() != '')
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
                                            // height: MediaQuery.of(context)
                                            //         .size
                                            //         .height /
                                            //     5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Card(
                                              child:
                                                  // SingleChildScrollView(
                                                  //     child:
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 5, 0, 0),
                                                        child: Text(
                                                            '  Address2 :',
                                                            style: TextStyle(
                                                              fontFamily: 'Verdana',
                                                                color: Colors
                                                                    .yellow,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .04,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold
                                                            ))),
                                                    if (listdata1[0]
                                                            .office_address2
                                                            .toString() !=
                                                        '')
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  25, 5, 25, 7),
                                                          child: Material(
                                                            // needed
                                                            color: Colors
                                                                .transparent,
                                                            child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  var url = listdata1[
                                                                          0]
                                                                      .google_map_link2
                                                                      .toString();
                                                                  js.context
                                                                      .callMethod(
                                                                          'open',
                                                                          [
                                                                        url
                                                                      ]);
                                                                },
                                                                child: Text(
                                                                    listdata1[0]
                                                                        .office_address2
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                      fontFamily: 'Verdana',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.width *
                                                                                .04,
                                                                        // fontWeight:
                                                                        //     FontWeight.bold
                                                                    ))),
                                                          )),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ]),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
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
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .06,
                                          backgroundColor: Colors.white,
                                          child: Material(
                                            // needed
                                            color: Colors.transparent,
                                            child: InkWell(
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.black,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .06,
                                              ),
                                            ),
                                          ),
                                        ))))
                                  ])),
                            SizedBox(
                              height: 20,
                            ),
                            if (listdata1[0].qrcodeimg.toString() != '')
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      color: Color(0xffE9E9E9),
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 5, 20, 0),
                                          child: Text(
                                            '    YOU CAN ALSO PAY'
                                            '\n USING YOUR UPI APPS',
                                            style: TextStyle(
                                                fontFamily: 'Verdana',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            if (listdata1[0].qrcodeimg.toString() != '')
                              SizedBox(
                                height: 20,
                              ),
                            if (listdata1[0].qrcodeimg.toString() != '')
                              Padding(
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
                                      ])),
                            if (listdata1[0].qrcodeimg.toString() != '')
                              SizedBox(
                                height: 20,
                              ),
                            if (multiplelist.isNotEmpty)
                              FutureBuilder(
                                  future: multiple_Future,
                                  builder: (context, snapshot) {
                                    return snapshot.hasData
                                        ? Column(children: <Widget>[
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    // height: MediaQuery.of(context).size.height/8,
                                                    // width: MediaQuery.of(context).size.width/1,
                                                    color: Color(0xffE9E9E9),
                                                    child: Center(
                                                      child: Text(
                                                        'GALLERY',
                                                        style: TextStyle(
                                                            fontFamily: 'Verdana',
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            backgroundColor:
                                                                Colors.green
                                                                    .shade900),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      multiplelist.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    childAspectRatio:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.3),
                                                    crossAxisSpacing: 12,
                                                    // mainAxisSpacing:
                                                    //   6,
                                                  ),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Center(
                                                        child: Wrap(
                                                      spacing: 30,
                                                      direction:
                                                          Axis.horizontal,
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
                                          ])
                                        : Text('');
                                  }),
                            if (multiplelist.isNotEmpty)
                              SizedBox(
                                height: 60,
                              ),
                            if (listdata1[0].pdf.toString() != '')
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                11,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Color(0xff007356),
                                        child: Center(
                                          child: Text(
                                            '  DOWNLOAD OUR BROUCHER ',
                                            style: TextStyle(
                                              fontFamily: 'Verdana',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ]),
                            if (listdata1[0].pdf.toString() != '')
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  width: MediaQuery.of(context).size.width,
                                  color: Color(0xff007356),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
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
                                        SizedBox(width: 5,),
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                9,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.4,
                                            color: Color(0xff007356),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
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
                                                        fontFamily: 'Verdana',
                                                        color: Colors.black,
                                                        fontSize: 16,
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
                            // Spacer(),
                           Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "Powered by FUTURE INFOTECH",
                                    style: TextStyle(
                                        fontFamily: 'Verdana',
                                        color: Colors.black,
                                        fontSize: 15,
                                        //fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
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
        bottomNavigationBar: FutureBuilder(
            future: leadlist_Future,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? (listdata1[0].phone.toString() != '0')
                      ? Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                              width: 400,
                              height: 45,
                              color: Color(0xffE9E9E9),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff007356),
                                ),
                                onPressed: () async {
                                  var vCard = VCard();

                                  final vCardContent = '''BEGIN:VCARD
VERSION:3.0
N:${listdata1[0].cusname.toString() ?? ''}
ORG:${listdata1[0].companyname.toString() ?? ''}
TEL;TYPE=WORK,VOICE:${listdata1[0].phone.toString() ?? ''}
TEL;TYPE=HOME,VOICE:${listdata1[0].mobile.toString() ?? ''}
EMAIL:${listdata1[0].email.toString() ?? ''}
URL:${listdata1[0].website.toString() ?? ''}
END:VCARD''';

                                  final vCardContentIOS = '''BEGIN:VCARD
VERSION:2.1
N:;${listdata1[0].cusname.toString() ?? ''}
ORG:${listdata1[0].companyname.toString() ?? ''}
TEL;WORK;VOICE;PREF:${listdata1[0].phone.toString() ?? ''}
TEL;WORK;FAX:${listdata1[0].mobile.toString() ?? ''}
EMAIL;INTERNET;PREF:${listdata1[0].email.toString() ?? ''}
URL;WORK;PREF:${listdata1[0].website.toString() ?? ''}
END:VCARD''';


                                  final encodedContent = (kIsWeb)?utf8.encode(vCardContent):utf8.encode(vCardContentIOS);

                                  final blob =
                                      html.Blob([encodedContent], 'text/vcard');

                                  final url =
                                      html.Url.createObjectUrlFromBlob(blob);

                                  final anchor = html.AnchorElement(href: url)
                                    ..setAttribute('download',
                                        '${listdata1[0].cusname.toString() ?? ''}.vcf')
                                    ..click();

                                  html.Url.revokeObjectUrl(url);

                                  /// Save to file
                                  // vCard.saveToFile('./contact.vcf');

                                  /// Get as formatted string
                                  print(vCard.getFormattedString());
                                },
                                icon: Icon(
                                  CupertinoIcons.person_crop_circle,
                                  size: 27.0,
                                ),
                                label: Text(
                                  'ADD TO CONTACT',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Verdana',
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                              //))
                              ))
                      : Text("")
                  : CircularProgressIndicator();
            }));
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
