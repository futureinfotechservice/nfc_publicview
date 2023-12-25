import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dpscreen2.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class listdata {
  String profile_image;

  listdata({
    required this.profile_image,
  });

  factory listdata.fromJson(Map<String, dynamic> json) {
    return listdata(
      profile_image: json['profile_image'],
    );
  }
}

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

class updateprofile_listdata {
  String id;
  String full_name;
  String contact_number;
  String contact_number2;
  String company_name;
  String designation;
  String email_address;
  String email_address2;
  String web_link;
  String date_of_birth;
  String blood_group;
  String about;
  String office_address;
  String office_address2;
  String nature_of_business;
  String pincode;
  String google_map_link;
  String google_map_link2;
  String profile_image;
  String banner_image;
  String upi_payment_scanner;
  String facebook_details;
  String instagram_details;
  String linkedin_details;
  String twitter_details;
  String whatsapp_no;
  String telegram_url;
  String youtube;
  String pinterest;
  String broucher;
  String Terms_Cond;
  String profile_imageindex;
  String banner_imageindex;
  String upi_payment_scannerindex;
  String broucherimage_index;
  String country_contactnumber;
  String country_contactnumber2;
  String country_whatsappnumber2;

  updateprofile_listdata({
    required this.id,
    required this.full_name,
    required this.contact_number,
    required this.contact_number2,
    required this.company_name,
    required this.designation,
    required this.email_address,
    required this.email_address2,
    required this.web_link,
    required this.date_of_birth,
    required this.blood_group,
    required this.about,
    required this.office_address,
    required this.office_address2,
    required this.nature_of_business,
    required this.pincode,
    required this.google_map_link,
    required this.google_map_link2,
    required this.profile_image,
    required this.banner_image,
    required this.upi_payment_scanner,
    required this.facebook_details,
    required this.instagram_details,
    required this.linkedin_details,
    required this.twitter_details,
    required this.whatsapp_no,
    required this.telegram_url,
    required this.youtube,
    required this.pinterest,
    required this.broucher,
    required this.Terms_Cond,
    required this.profile_imageindex,
    required this.banner_imageindex,
    required this.upi_payment_scannerindex,
    required this.broucherimage_index,
    required this.country_contactnumber,
    required this.country_contactnumber2,
    required this.country_whatsappnumber2,
  });

  factory updateprofile_listdata.fromJson(Map<String, dynamic> json) {
    return updateprofile_listdata(
      id: json['id'],
      full_name: json['full_name'],
      contact_number: json['contact_number'],
      contact_number2: json['contact_number2'],
      company_name: json['company_name'],
      designation: json['designation'],
      email_address: json['email_address'],
      email_address2: json['email_address2'],
      web_link: json['web_link'],
      date_of_birth: json['date_of_birth'],
      blood_group: json['blood_group'],
      about: json['about'],
      office_address: json['office_address'],
      office_address2: json['office_address2'],
      nature_of_business: json['nature_of_business'],
      pincode: json['pincode'],
      google_map_link: json['google_map_link'],
      google_map_link2: json['google_map_link2'],
      profile_image: json['profile_image'],
      banner_image: json['banner_image'],
      upi_payment_scanner: json['upi_payment_scanner'],
      facebook_details: json['facebook_details'],
      instagram_details: json['instagram_details'],
      linkedin_details: json['linkedin_details'],
      twitter_details: json['twitter_details'],
      whatsapp_no: json['whatsapp_no'],
      telegram_url: json['telegram_url'],
      youtube: json['youtube'],
      pinterest: json['pinterest'],
      broucher: json['broucher'],
      Terms_Cond: json['Terms_Cond'],
      profile_imageindex: json['profile_imageindex'],
      banner_imageindex: json['banner_imageindex'],
      upi_payment_scannerindex: json['upi_payment_scannerindex'],
      broucherimage_index: json['broucherimage_index'],
      country_contactnumber: json['country_contactnumber'],
      country_contactnumber2: json['country_contactnumber2'],
      country_whatsappnumber2: json['country_whatsappnumber2'],
    );
  }
}

class admin_update_profile extends StatefulWidget {
  String? id;

  admin_update_profile(this.id);

  @override
  admin_update_profile2 createState() => admin_update_profile2(id);
}

class admin_update_profile2 extends State<admin_update_profile> {
  bool isLoading = false;
  bool isLoading1 = false;
  bool isLoading3 = false;
  bool isLoading4 = false;
  bool isLoading5 = false;

  late Future<List> report_Future;
  List<listdata> reportlist = [];
  String? id;

  admin_update_profile2(this.id);

  String updateprofile = '0';
  String updatebanner = '0';
  String updateupi = '0';
  String updatebroucher = '0';

  bool value = false;

  int value_check = 0;

  bool showbtn = false;
  ScrollController scrollController = ScrollController();

  String? _fileName;
  Uint8List? fileBytes;
  List<int> updateBytes = [];
  String? _fileName1;
  Uint8List? fileBytes1;
  List<int> updateBytes1 = [];
  String? _fileName2;
  Uint8List? fileBytes2;
  List<int> updateBytes2 = [];

  Uint8List? _fileBytes4;
  Uint8List? _fileBytes5;
  String? _fileName4;
  List<int> updateBytes4 = [];
  List<Uint8List> _fileBytesList5 = [];
  String? _fileName5;
  List<String> _fileNames5List = [];

  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController contactnumbercontroller = TextEditingController();
  TextEditingController contactnumber2controller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController emailaddresscontroller = TextEditingController();
  TextEditingController emailaddress2controller = TextEditingController();
  TextEditingController weblinkcontroller = TextEditingController();
  TextEditingController dateofbirthcontroller = TextEditingController();
  TextEditingController bloodgroupcontroller = TextEditingController();
  TextEditingController aboutcontroller = TextEditingController();
  TextEditingController officeaddresscontroller = TextEditingController();
  TextEditingController natureofbusinesscontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController googlemaplinkcontroller = TextEditingController();
  TextEditingController facebookdetailscontroller = TextEditingController();
  TextEditingController instagramdetailscontroller = TextEditingController();
  TextEditingController linkedindetailscontroller = TextEditingController();
  TextEditingController twitterdetailscontroller = TextEditingController();
  TextEditingController whatsappnocontroller = TextEditingController();
  TextEditingController telegramurlcontroller = TextEditingController();
  TextEditingController youtubecontroller = TextEditingController();
  TextEditingController pinterestcontroller = TextEditingController();

  TextEditingController officeaddress2controller = TextEditingController();
  TextEditingController googlemaplink1controller = TextEditingController();

  String country_contactnumber = 'IN';
  String country_contactnumber2 = 'IN';
  String country_whatsappnumber2 = 'IN';

  String? profileimage;
  String? bannerimage;
  String? urlimage;

  String? urlimagename;
  String? bannerimagename;
  String? profileimagename;

  String? broucherimage;

  List<updateprofile_listdata> updateprofilelist = [];
  List<multiple_listdata> multiplelist = [];
  late Future<List> multiple_Future;
  late Future<List> downloadjson_Future;

  String profile_image = '';

  Future<List<listdata>> downloadJSON(context) async {
    reportlist.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    final company_id = prefs.getString('company_id') ?? '';
    //print("admin scaffold");
    // print(userid.toString());
    // print(company_id.toString());
    var url =
        Uri.parse('https://nfc.futureinfotechservices.in/profile_image.php');

    var data = {
      // 'userid': userid.toString(),
      'userid': id.toString(),
      'company_id': company_id.toString(),
    };
    var response = await http.post(url, body: json.encode(data));
    final items = json.decode(response.body);
    items.forEach((api) {
      final ab = new listdata(
        profile_image: api['profile_image'],
      );
      reportlist.add(ab);
    });
    profile_image = reportlist[0].profile_image.toString();
    // print(reportlist[0].profile_image.toString());
    return reportlist;
  }

  Future<List<multiple_listdata>> downloadJSON_multiple(context) async {
    multiplelist.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    final company_id = prefs.getString('company_id') ?? '';

    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/updateprofile_multipleimage.php');
    var data = {
      // 'user_id': userid.toString(),
      'user_id': id.toString(),
      'company_id': company_id.toString(),
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

  Future<List<updateprofile_listdata>> downloadJSON2(context) async {
    updateprofilelist.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    final company_id = prefs.getString('company_id') ?? '';

    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/updateprofile_list1.php');
    var data = {
      // 'user_id': userid.toString(),
      'user_id': id.toString(),
      'company_id': company_id.toString(),
    }; //to load an rowid  {item is the name used in php file}
    // var response = await http.get(url);
    var response = await http.post(url, body: json.encode(data));

    final items = json.decode(response.body);

    items.forEach((api) {
      final ab = new updateprofile_listdata(
        id: api['id'],
        full_name: api['full_name'],
        contact_number: api['contact_number'],
        contact_number2: api['contact_number2'],
        company_name: api['company_name'],
        designation: api['designation'],
        email_address: api['email_address'],
        email_address2: api['email_address2'],
        web_link: api['web_link'],
        date_of_birth: api['date_of_birth'],
        blood_group: api['blood_group'],
        about: api['about'],
        office_address: api['office_address'],
        office_address2: api['office_address2'],
        nature_of_business: api['nature_of_business'],
        pincode: api['pincode'],
        google_map_link: api['google_map_link'],
        google_map_link2: api['google_map_link2'],
        profile_image: api['profile_image'],
        banner_image: api['banner_image'],
        upi_payment_scanner: api['upi_payment_scanner'],
        facebook_details: api['facebook_details'],
        instagram_details: api['instagram_details'],
        linkedin_details: api['linkedin_details'],
        twitter_details: api['twitter_details'],
        whatsapp_no: api['whatsapp_no'],
        telegram_url: api['telegram_url'],
        youtube: api['youtube'],
        pinterest: api['pinterest'],
        broucher: api['broucher'],
        Terms_Cond: api['Terms_Cond'],
        profile_imageindex: api['profile_imageindex'],
        banner_imageindex: api['banner_imageindex'],
        upi_payment_scannerindex: api['upi_payment_scannerindex'],
        broucherimage_index: api['broucher_scannerindex'],
        country_contactnumber: api['country_contactnumber'],
        country_contactnumber2: api['country_contactnumber2'],
        country_whatsappnumber2: api['country_whatsappnumber2'],
      );
      updateprofilelist.add(ab);
    });

    fullnamecontroller.text = updateprofilelist[0].full_name.toString();
    contactnumbercontroller.text =
        (updateprofilelist[0].contact_number.toString() == '0')
            ? ''
            : updateprofilelist[0].contact_number.toString();
    contactnumber2controller.text =
        (updateprofilelist[0].contact_number2.toString() == '0')
            ? ''
            : updateprofilelist[0].contact_number2.toString();
    companynamecontroller.text = updateprofilelist[0].company_name.toString();
    designationcontroller.text = updateprofilelist[0].designation.toString();
    emailaddresscontroller.text = updateprofilelist[0].email_address.toString();
    emailaddress2controller.text =
        updateprofilelist[0].email_address2.toString();
    weblinkcontroller.text = updateprofilelist[0].web_link.toString();
    dateofbirthcontroller.text = updateprofilelist[0].date_of_birth.toString();
    bloodgroupcontroller.text = updateprofilelist[0].blood_group.toString();
    aboutcontroller.text = updateprofilelist[0].about.toString();
    officeaddresscontroller.text =
        updateprofilelist[0].office_address.toString();
    officeaddress2controller.text =
        updateprofilelist[0].office_address2.toString();
    natureofbusinesscontroller.text =
        updateprofilelist[0].nature_of_business.toString();
    pincodecontroller.text = (updateprofilelist[0].pincode.toString() == '0')
        ? ''
        : updateprofilelist[0].pincode.toString();
    googlemaplinkcontroller.text =
        updateprofilelist[0].google_map_link.toString();
    googlemaplink1controller.text =
        updateprofilelist[0].google_map_link2.toString();
    facebookdetailscontroller.text =
        updateprofilelist[0].facebook_details.toString();
    instagramdetailscontroller.text =
        updateprofilelist[0].instagram_details.toString();
    linkedindetailscontroller.text =
        updateprofilelist[0].linkedin_details.toString();
    twitterdetailscontroller.text =
        updateprofilelist[0].twitter_details.toString();
    whatsappnocontroller.text =
        (updateprofilelist[0].whatsapp_no.toString() == '0')
            ? ''
            : updateprofilelist[0].whatsapp_no.toString();
    telegramurlcontroller.text = updateprofilelist[0].telegram_url.toString();
    youtubecontroller.text = updateprofilelist[0].youtube.toString();
    pinterestcontroller.text = updateprofilelist[0].pinterest.toString();
    value_check = int.parse(updateprofilelist[0].Terms_Cond.toString());
    profileimage = updateprofilelist[0].profile_image.toString();
    bannerimage = updateprofilelist[0].banner_image.toString();
    urlimage = updateprofilelist[0].upi_payment_scanner.toString();

    profileimagename = updateprofilelist[0].profile_imageindex.toString();
    bannerimagename = updateprofilelist[0].banner_imageindex.toString();
    urlimagename = updateprofilelist[0].upi_payment_scannerindex.toString();
    broucherimage =
        (updateprofilelist[0].broucherimage_index.toString() == 'null')
            ? ''
            : updateprofilelist[0].broucherimage_index.toString();

    // String pdfbroucherimage = updateprofilelist[0].broucher.toString();
    //
    // Uri uri = Uri.parse(pdfbroucherimage);
    // List<String> segments = uri.pathSegments;
    //
    // if (segments.isNotEmpty) {
    //   broucherimage = segments.last;
    //   print("Last segment of the URL: $broucherimage");
    // } else {
    //   print("URL has no path segments.");
    //   print('$broucherimage');
    // }

    country_contactnumber =
        updateprofilelist[0].country_contactnumber.toString();
    print("country_contactnumber" +
        updateprofilelist[0].country_contactnumber.toString());

    country_contactnumber2 =
        updateprofilelist[0].country_contactnumber2.toString();
    country_whatsappnumber2 =
        updateprofilelist[0].country_whatsappnumber2.toString();

    return updateprofilelist;
  }

  Future Insertdata(BuildContext context) async {
    //print("inserting"+country_contactnumber.toString());
    // print(_fileName1.toString());
    // print(_fileName2.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    final company_id = prefs.getString('company_id') ?? '';

    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/updateprofile_insert2.php');
    var data = {
      // 'user_id': userid.toString(),
      'user_id': (id.toString() == "") ? '0' : id.toString(),
      'company_id': company_id.toString(),
      'full_name': fullnamecontroller.text.toString(),
      'contact_number': contactnumbercontroller.text.toString(),
      'contact_number2': contactnumber2controller.text.toString(),
      'company_name': companynamecontroller.text.toString(),
      'designation': designationcontroller.text.toString(),
      'email_address': emailaddresscontroller.text.toString(),
      'email_address2': emailaddress2controller.text.toString(),
      'web_link': weblinkcontroller.text.toString(),
      'date_of_birth': dateofbirthcontroller.text.toString(),
      'blood_group': bloodgroupcontroller.text.toString(),
      'about': aboutcontroller.text.toString(),
      'office_address': officeaddresscontroller.text.toString(),
      'office_address2': officeaddress2controller.text.toString(),
      'nature_of_business': natureofbusinesscontroller.text.toString(),
      'pincode': pincodecontroller.text.toString(),
      'google_map_link': googlemaplinkcontroller.text.toString(),
      'google_map_link2': googlemaplink1controller.text.toString(),
      'filename': _fileName.toString(),
      'profile_image': base64Encode(updateBytes),
      'filename1': _fileName1.toString(),
      'banner_image': base64Encode(updateBytes1),
      'filename2': _fileName2.toString(),
      'upi_payment_scanner': base64Encode(updateBytes2),
      'filename4': _fileName4.toString(),
      'brochure': base64Encode(updateBytes4),
      'facebook_details': facebookdetailscontroller.text.toString(),
      'instagram_details': instagramdetailscontroller.text.toString(),
      'linkedin_details': linkedindetailscontroller.text.toString(),
      'twitter_details': twitterdetailscontroller.text.toString(),
      'whatsapp_no': whatsappnocontroller.text.toString(),
      'telegram_url': telegramurlcontroller.text.toString(),
      'youtube': youtubecontroller.text.toString(),
      'pinterest': pinterestcontroller.text.toString(),
      'Terms_Cond': value_check.toString(),
      'country_contactnumber': (country_contactnumber.toString() == '')
          ? 'IN'
          : country_contactnumber.toString(),
      'country_contactnumber2': (country_contactnumber2.toString() == '')
          ? 'IN'
          : country_contactnumber2.toString(),
      'country_whatsappnumber2': (country_whatsappnumber2.toString() == '')
          ? 'IN'
          : country_whatsappnumber2.toString(),
      'updateprofile': updateprofile.toString(),
      'updatebanner': updatebanner.toString(),
      'updateupi': updateupi.toString(),
      'updatebroucher': updatebroucher.toString(),
    };

    var response = await http.post(url, body: data);
    var message = jsonDecode(response.body);
    // print(message.toString());

    if (message.toString().contains('Updated successfully')) {
      Navigator.of(context).pop();
      for (int i = 0; i < _fileBytesList5.length; i++) {
        Insertimagedata(context, _fileNames5List[i].toString(),
            _fileBytesList5[i], i, _fileBytesList5.length, message.toString());
      }
      //print("length"+_fileBytesList5.length.toString());
      if (_fileBytesList5.length == 0) {
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return public(id.toString());
            },
          ),
          (_) => false,
        );

        //print("close");
        // Navigator.pop(context);
        // Navigator.pushNamed(
        //   context,
        //   admin_update_profile.routeName,
        //   arguments: ScreenArguments(
        //     ' Update Profile ',
        //   ),
        // );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => admin_update_profile(),
        //     ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message.toString()), backgroundColor: Colors.green));
        setState(() {});
      }
    } else if (message.toString().contains('Inserted successfully')) {
      Navigator.of(context).pop();
      for (int i = 0; i < _fileBytesList5.length; i++) {
        Insertimagedata(context, _fileNames5List[i].toString(),
            _fileBytesList5[i], i, _fileBytesList5.length, message.toString());
      }
      if (_fileBytesList5.length == 0) {
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return public(id.toString());
            },
          ),
          (_) => false,
        );

        // Navigator.pop(context);
        // Navigator.pushNamed(
        //   context,
        //   admin_update_profile.routeName,
        //   arguments: ScreenArguments(
        //     ' Add Profile ',
        //   ),
        // );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => admin_update_profile(),
        //     ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message.toString()), backgroundColor: Colors.green));
        setState(() {});
      }
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message.toString()), backgroundColor: Colors.red));
      setState(() {});
    }
  }

  Future Insertimagedata(
      BuildContext context,
      String imagetitle,
      List<int> imagevalue,
      int ivalue,
      int lengthlist,
      String Toastmessage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    final company_id = prefs.getString('company_id') ?? '';

    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/updateprofileimage_insert.php');
    var data = {
      'user_id': id.toString(),
      // 'user_id': userid.toString(),
      'company_id': company_id.toString(),
      'profile_image': base64Encode(imagevalue),
      'filename': imagetitle.toString(),
    };

    var response = await http.post(url, body: data);
    var message = jsonDecode(response.body);
    //print(message.toString());

    if (message.toString().contains('Inserted successfully')) {
      // print(ivalue);
      // print(lengthlist);
      if ((ivalue + 1) == lengthlist) {
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return public(id.toString());
            },
          ),
          (_) => false,
        );

        // print("open");
        // print(ivalue);
        // print(lengthlist);
        // Navigator.pop(context);
        // Navigator.pushNamed(
        //   context,
        //   admin_update_profile.routeName,
        //   arguments: ScreenArguments(
        //     ' Add Profile ',
        //   ),
        // );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => admin_update_profile(),
        //     ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(Toastmessage.toString()),
            backgroundColor: Colors.green));
        setState(() {});
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message.toString()), backgroundColor: Colors.red));
      setState(() {});
    }
  }

  Future Deleteimagedata(
      BuildContext context, String delete_id, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('id') ?? '';
    print("delete id" + delete_id.toString());
    var url = Uri.parse(
        'https://nfc.futureinfotechservices.in/delete_multipleimage.php');
    var data = {
      'id': delete_id.toString(),
    };

    var response = await http.post(url, body: data);
    var message = jsonDecode(response.body);
    //print(message.toString());

    if (message.toString().contains('Deleted successfully')) {
      setState(() {
        print("deleted index" + index.toString());
        multiplelist.removeAt(index);
      });

      // Navigator.pop(context);
      // Navigator.pushNamed(
      //   context,
      //   admin_update_profile.routeName,
      //   arguments: ScreenArguments(
      //     ' Update Profile ',
      //   ),
      // );
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => admin_update_profile(),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(message.toString()), backgroundColor: Colors.red));
      // setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message.toString()), backgroundColor: Colors.red));
      setState(() {});
    }
  }

  void _removeImage(int index) {
    setState(() {
      _fileBytesList5.removeAt(index);
      _fileNames5List.removeAt(index);
    });
  }

  void _loadCounter() async {
    String id;
    String email;
    String password;
    String activestatus;
    String company_id;
    String user_type;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    id = (prefs.remove('id')).toString();
    print('id' + id);
    email = (prefs.remove('email')).toString();
    print('email' + email);
    password = (prefs.remove('password')).toString();
    print('password' + password);
    activestatus = (prefs.remove('activestatus')).toString();
    print('activestatus' + activestatus);
    company_id = (prefs.remove('company_id')).toString();
    print('company_id' + company_id);
    user_type = (prefs.remove('user_type')).toString();
    print('user_type' + user_type);
  }

  @override
  void initState() {
    super.initState();
    report_Future = downloadJSON(context);
    downloadJSON2(context);

    downloadjson_Future = downloadJSON2(context);
    multiple_Future = downloadJSON_multiple(context);
    scrollController.addListener(() {
      double showoffset = 10.0;
      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {});
      } else {
        showbtn = false;
        setState(() {});
      }
    });
  }

  double _screenWidth = 0;
  static const _mobileThreshold = 768.0;
  bool _isMobile = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    if (_screenWidth == mediaQuery.size.width) {
      return;
    }

    setState(() {
      _isMobile = mediaQuery.size.width < _mobileThreshold;
      print("is mobile" + _isMobile.toString());
      _screenWidth = mediaQuery.size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Container(
                  //width: 400,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    // Padding(
                    //     padding: EdgeInsets.only(top: 4),
                    //     child: Tooltip(
                    //         message: "Home",
                    //         child: InkWell(
                    //           onTap: () {
                    //             Navigator.of(context, rootNavigator: true)
                    //                 .pushAndRemoveUntil(
                    //               MaterialPageRoute(
                    //                 builder: (BuildContext context) {
                    //                   return admin_home();
                    //                 },
                    //               ),
                    //                   (_) => false,
                    //             );
                    //           },
                    //           borderRadius: BorderRadius.circular(2),
                    //           child: Container(
                    //             padding: const EdgeInsets.all(4),
                    //             child: Icon(Icons.home,
                    //                 color: Colors.grey, size: 25),
                    //           ),
                    //         ))),
                    SizedBox(
                      width: 5,
                    ),
                    // Row(children: [
                    Image.asset('assects/etouch_cards.jpg',
                        width: 150, height: 100),
                    SizedBox(
                      width: 5,
                    )
                    //  ])
                  ])),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black12,
                          width: 2.0,
                        ),
                      ),
                      child: FutureBuilder(
                          future: report_Future,
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: (profile_image.toString() ==
                                                'null' ||
                                            profile_image.toString() == '')
                                        ? Image.asset('assects/person_icon.png',
                                            width: 50, height: 50)
                                        : Image.network(
                                            profile_image.toString(),
                                            width: 50,
                                            height: 50),
                                  )
                                : Image.asset('assects/person_icon.png',
                                    width: 50, height: 50);
                          }),
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButton: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: showbtn ? 1.0 : 0.0,
          child: Container(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(0,
                    duration: Duration(milliseconds: 500), //duration of scroll
                    curve: Curves.fastOutSlowIn //scroll type
                    );
              },
              child: Icon(Icons.arrow_upward),
              backgroundColor: Color(0xFFCC9B60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ),
          ),
        ),
        body:
        SingleChildScrollView(
          child:
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 15.0, top: 4, bottom: 4),
                  child: Text(
                    ' Update Profile ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF505D6E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                // Padding(
                //     padding: EdgeInsets.all(20),
                //     child: Container(
                //         decoration: BoxDecoration(
                //           color: Colors.blueGrey.shade50,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         height: MediaQuery.of(context).size.height / 1.4,
                //         width: double.infinity,
                //         child: Padding(
                //             padding: EdgeInsets.all(20),
                //             child: Container(
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(10),
                //                 ),
                //                 height:
                //                     MediaQuery.of(context).size.height / 1.4,
                //                 width: double.infinity,
                //                 child:
                //                 SingleChildScrollView(
                //                     //controller: scrollController,
                //                     scrollDirection: Axis.vertical,
                //                     child:
                                    Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Profile Details",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ]),
                                              SizedBox(
                                                height: 33,
                                              ),
                                              TextField(
                                                controller: fullnamecontroller,
                                                decoration: InputDecoration(
                                                    // floatingLabelBehavior:
                                                    //     FloatingLabelBehavior
                                                    //         .never,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Full Name",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.person,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              FutureBuilder(
                                                  future: downloadjson_Future,
                                                  builder: (context, snapshot) {
                                                    return IntlPhoneField(
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      disableLengthCheck: true,
                                                      controller:
                                                          contactnumbercontroller,

                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF505D6E)),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors
                                                            .blueGrey.shade50,
                                                        labelText:
                                                            "Contact Number",
                                                        labelStyle: TextStyle(
                                                            color: Colors
                                                                .blueGrey),
                                                      ),

                                                      initialCountryCode:
                                                          //country_contactnumber =
                                                          updateprofilelist[0]
                                                              .country_contactnumber
                                                              .toString(),
                                                      onCountryChanged:
                                                          (country) {
                                                        print(
                                                            'Country changed to: ' +
                                                                country.name);
                                                        print(
                                                            'Country changed to: ' +
                                                                country.code);
                                                        country_contactnumber =
                                                            country.code;
                                                      },

                                                      // onChanged: (phone) {
                                                      //   print(phone
                                                      //       .countryISOCode);
                                                      //   country_contactnumber =
                                                      //       phone
                                                      //           .countryISOCode;
                                                      // },
                                                    );
                                                  }),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              FutureBuilder(
                                                  future: downloadjson_Future,
                                                  builder: (context, snapshot) {
                                                    return IntlPhoneField(
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      disableLengthCheck: true,
                                                      controller:
                                                          contactnumber2controller,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF505D6E)),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors
                                                            .blueGrey.shade50,
                                                        labelText:
                                                            "Alternate Phone Number",
                                                        labelStyle: TextStyle(
                                                            color: Colors
                                                                .blueGrey),
                                                      ),
                                                      initialCountryCode:
                                                          // country_contactnumber2 =
                                                          updateprofilelist[0]
                                                              .country_contactnumber2
                                                              .toString(),
                                                      onCountryChanged:
                                                          (country) {
                                                        print(
                                                            'Country changed to: ' +
                                                                country.name);
                                                        print(
                                                            'Country changed to: ' +
                                                                country.code);
                                                        country_contactnumber2 =
                                                            country.code;
                                                      },
                                                    );
                                                  }),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    companynamecontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Company Name",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.business,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    designationcontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Designation",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.business,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    emailaddresscontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Email Address",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.business,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    emailaddress2controller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText:
                                                        "Alternate Email Address",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.email_rounded,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller: weblinkcontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Website Link",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.web,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                showCursor: false,
                                                controller:
                                                    dateofbirthcontroller,
                                                // keyboardType: TextInputType.emailAddress,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Date of Birth",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.calendar_today,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                                onTap: () async {
                                                  final selectedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2100),
                                                    initialDate: DateTime.now(),
                                                    // selectableDayPredicate: (day) =>
                                                    //     day.isBefore(DateTime.now()),
                                                  );
                                                  if (selectedDate != null) {
                                                    setState(() {
                                                      dateofbirthcontroller
                                                          .text = DateFormat(
                                                              "yyyy-MM-dd")
                                                          .format(selectedDate)
                                                          .toString();
                                                    });
                                                  }
                                                },
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    bloodgroupcontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Blood Group",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.bloodtype,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                height: 120,
                                                child: TextField(
                                                  style: TextStyle(
                                                      color: Color(0xFF505D6E)),
                                                  maxLines: 300,
                                                  controller: aboutcontroller,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors
                                                          .blueGrey.shade50,
                                                      labelText: "About",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Colors.blueGrey),
                                                      prefixIcon: Icon(
                                                        Icons.favorite,
                                                        color: Colors
                                                            .blueGrey[300],
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                height: 100,
                                                child: TextField(
                                                  style: TextStyle(
                                                      color: Color(0xFF505D6E)),
                                                  maxLines: 300,
                                                  controller:
                                                      natureofbusinesscontroller,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors
                                                          .blueGrey.shade50,
                                                      labelText:
                                                          "Nature of Business",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Colors.blueGrey),
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .add_business_sharp,
                                                        color: Colors
                                                            .blueGrey[300],
                                                      )),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15,
                                              // ),
                                              // TextField(
                                              //   style: TextStyle(
                                              //       color: Color(
                                              //           0xFF505D6E)),
                                              //   controller:
                                              //   pincodecontroller,
                                              //   decoration:
                                              //   InputDecoration(
                                              //       border:
                                              //       OutlineInputBorder(
                                              //         borderRadius:
                                              //         BorderRadius
                                              //             .circular(
                                              //             8.0),
                                              //         borderSide:
                                              //         BorderSide
                                              //             .none,
                                              //       ),
                                              //       filled: true,
                                              //       fillColor: Colors
                                              //           .blueGrey
                                              //           .shade50,
                                              //       labelText:
                                              //       "Pin Code",
                                              //       labelStyle: TextStyle(
                                              //           color: Colors
                                              //               .blueGrey),
                                              //       prefixIcon: Icon(
                                              //         Icons.pin,
                                              //         color: Colors
                                              //             .blueGrey[
                                              //         300],
                                              //       )),
                                              // ),
                                              SizedBox(
                                                height: 15,
                                              ),

                                              Container(
                                                height: 100,
                                                child: TextField(
                                                  style: TextStyle(
                                                      color: Color(0xFF505D6E)),
                                                  maxLines: 300,
                                                  controller:
                                                      officeaddresscontroller,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors
                                                          .blueGrey.shade50,
                                                      labelText: "Address1",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Colors.blueGrey),
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .add_business_outlined,
                                                        color: Colors
                                                            .blueGrey[300],
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    googlemaplinkcontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText:
                                                        "Google Map Link for Address1",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),

                                              Container(
                                                height: 100,
                                                child: TextField(
                                                  style: TextStyle(
                                                      color: Color(0xFF505D6E)),
                                                  maxLines: 300,
                                                  controller:
                                                      officeaddress2controller,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors
                                                          .blueGrey.shade50,
                                                      labelText: "Address2",
                                                      labelStyle: TextStyle(
                                                          color:
                                                              Colors.blueGrey),
                                                      prefixIcon: Icon(
                                                        Icons.add_business,
                                                        color: Colors
                                                            .blueGrey[300],
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    googlemaplink1controller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText:
                                                        "Google Map Link for Address2",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.location_on,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Profile Image",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // SizedBox(
                                                    //   width: 30,
                                                    // ),
                                                    InkWell(
                                                        onTap: () async {
                                                          final input =
                                                              FileUploadInputElement();
                                                          input.accept =
                                                              'image/*';
                                                          input.click();
                                                          setState(() {
                                                            isLoading = true;
                                                          });
                                                          input.onChange
                                                              .listen((e) {
                                                            final filename =
                                                                input.files?.first;
                                                            final files =
                                                                input.files;

                                                            if (files!.length ==
                                                                1) {
                                                              final file =
                                                                  files[0];

                                                              final reader =
                                                                  FileReader();
                                                              reader.onLoadEnd
                                                                  .listen(
                                                                      (e) async {

                                                                final bytes = Base64Decoder()
                                                                    .convert(reader
                                                                        .result
                                                                        .toString()
                                                                        .split(
                                                                            ",")
                                                                        .last);

                                                                setState(() {
                                                                  if (bytes != null) {
                                                                    _fileName =
                                                                        filename
                                                                            ?.name;

                                                                    fileBytes =
                                                                        bytes;
                                                                    updateBytes =
                                                                        bytes;
                                                                    if (_fileName !=
                                                                        null) {
                                                                      updateprofile =
                                                                          '1';
                                                                    }
                                                                  }
                                                                });
                                                              });
                                                              reader
                                                                  .readAsDataUrl(
                                                                      file);
                                                            }
                                                            setState(() {
                                                              isLoading = false;
                                                            });
                                                          });
                                                          void
                                                              cancelledeventlistener(
                                                                  e) {
                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 6),
                                                                () {
                                                              if (input.files!
                                                                  .isEmpty) {
                                                                html.window
                                                                    .removeEventListener(
                                                                        'focus',
                                                                        cancelledeventlistener);
                                                                setState(() {
                                                                  isLoading =
                                                                      false;
                                                                });
                                                              }
                                                            });
                                                          }

                                                          html.window
                                                              .addEventListener(
                                                                  'focus',
                                                                  cancelledeventlistener);
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .shade50,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            height: 160,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.8,
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  isLoading
                                                                      ? CircularProgressIndicator()
                                                                      : (fileBytes ==
                                                                              null)
                                                                          ? (profileimage.toString() == 'null' || profileimage.toString() == '')
                                                                              ? Icon(Icons.add_box_rounded, size: 50, color: Colors.blueGrey[300])
                                                                              : Column(children: [
                                                                                  Image.network(profileimage.toString(), width: 100, height: 90, fit: BoxFit.fill),
                                                                                  SizedBox(height: 2),
                                                                                  Text(
                                                                                    ' ${profileimagename} ',
                                                                                    style: TextStyle(color: Colors.black45, fontSize: 13),
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                ])
                                                                          : ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                              child: Column(children: [
                                                                                Image.memory(fileBytes!, width: 100, height: 90, fit: BoxFit.fill,filterQuality: FilterQuality.low,),
                                                                                SizedBox(height: 2),
                                                                                Text(
                                                                                  ' ${_fileName} ',
                                                                                  style: TextStyle(color: Colors.black45, fontSize: 13),
                                                                                ),
                                                                                SizedBox(height: 2),
                                                                              ]),
                                                                            ),
                                                                  Text(
                                                                      "Choose Image",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.blueGrey))
                                                                ])))
                                                  ]),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Banner Image",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                        onTap: () async {
                                                          final input =
                                                              FileUploadInputElement();
                                                          input.accept =
                                                              'image/*';
                                                          input.click();
                                                          setState(() {
                                                            isLoading1 = true;
                                                          });
                                                          input.onChange
                                                              .listen((e) {
                                                            final filename =
                                                                input.files
                                                                    ?.first;
                                                            final files =
                                                                input.files;
                                                            if (files!.length ==
                                                                1) {
                                                              final file =
                                                                  files[0];
                                                              final reader =
                                                                  FileReader();
                                                              reader.onLoadEnd
                                                                  .listen(
                                                                      (e) async {
                                                                final bytes = Base64Decoder()
                                                                    .convert(reader
                                                                        .result
                                                                        .toString()
                                                                        .split(
                                                                            ",")
                                                                        .last);
                                                                setState(() {
                                                                  if (bytes !=
                                                                      null) {
                                                                    _fileName1 =
                                                                        filename
                                                                            ?.name;
                                                                    print(_fileName1
                                                                        .toString());
                                                                    fileBytes1 =
                                                                        bytes;
                                                                    updateBytes1 =
                                                                        bytes;
                                                                    if (_fileName1 !=
                                                                        null) {
                                                                      updatebanner =
                                                                          '1';
                                                                    }
                                                                  }
                                                                });
                                                              });
                                                              reader
                                                                  .readAsDataUrl(
                                                                      file);
                                                            }
                                                            setState(() {
                                                              isLoading1 =
                                                                  false;
                                                            });
                                                          });
                                                          void
                                                              cancelledeventlistener(
                                                                  e) {
                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 6),
                                                                () {
                                                              if (input.files!
                                                                  .isEmpty) {
                                                                html.window
                                                                    .removeEventListener(
                                                                        'focus',
                                                                        cancelledeventlistener);
                                                                setState(() {
                                                                  isLoading1 =
                                                                      false;
                                                                });
                                                              }
                                                            });
                                                          }

                                                          html.window
                                                              .addEventListener(
                                                                  'focus',
                                                                  cancelledeventlistener);
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .shade50,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            height: 160,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.8,
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  isLoading1
                                                                      ? CircularProgressIndicator()
                                                                      : (fileBytes1 ==
                                                                              null)
                                                                          ? (bannerimage.toString() == 'null' || bannerimage.toString() == '')
                                                                              ? Icon(Icons.add_box_rounded, size: 50, color: Colors.blueGrey[300])
                                                                              : Column(children: [
                                                                                  Image.network(bannerimage.toString(), width: 100, height: 90, fit: BoxFit.fill),
                                                                                  SizedBox(height: 2),
                                                                                  Text(
                                                                                    ' ${bannerimagename} ',
                                                                                    style: TextStyle(color: Colors.black45, fontSize: 13),
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                ])
                                                                          : ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                              child: Column(children: [
                                                                                Image.memory(fileBytes1!, width: 100, height: 90, fit: BoxFit.fill,filterQuality: FilterQuality.low),
                                                                                SizedBox(height: 2),
                                                                                Text(
                                                                                  ' ${_fileName1} ',
                                                                                  style: TextStyle(color: Colors.black45, fontSize: 13),
                                                                                ),
                                                                                SizedBox(height: 2),
                                                                              ]),
                                                                            ),
                                                                  Text(
                                                                      "Choose Image",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.blueGrey))
                                                                ])))
                                                  ]),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "UPI Payment Scanner",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                        onTap: () async {
                                                          final input =
                                                              FileUploadInputElement();
                                                          input.accept =
                                                              'image/*';
                                                          input.click();
                                                          setState(() {
                                                            isLoading3 = true;
                                                          });
                                                          input.onChange
                                                              .listen((e) {
                                                            final filename =
                                                                input.files
                                                                    ?.first;
                                                            final files =
                                                                input.files;
                                                            if (files!.length ==
                                                                1) {
                                                              final file =
                                                                  files[0];
                                                              final reader =
                                                                  FileReader();
                                                              reader.onLoadEnd
                                                                  .listen(
                                                                      (e) async {
                                                                final bytes = Base64Decoder()
                                                                    .convert(reader
                                                                        .result
                                                                        .toString()
                                                                        .split(
                                                                            ",")
                                                                        .last);
                                                                setState(() {
                                                                  if (bytes !=
                                                                      null) {
                                                                    _fileName2 =
                                                                        filename
                                                                            ?.name;
                                                                    print(_fileName2
                                                                        .toString());
                                                                    fileBytes2 =
                                                                        bytes;
                                                                    updateBytes2 =
                                                                        bytes;
                                                                    if (_fileName2 !=
                                                                        null) {
                                                                      updateupi =
                                                                          '1';
                                                                    }
                                                                  }
                                                                });
                                                              });
                                                              reader
                                                                  .readAsDataUrl(
                                                                      file);
                                                            }
                                                            setState(() {
                                                              isLoading3 =
                                                                  false;
                                                            });
                                                          });
                                                          void
                                                              cancelledeventlistener(
                                                                  e) {
                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 6),
                                                                () {
                                                              if (input.files!
                                                                  .isEmpty) {
                                                                html.window
                                                                    .removeEventListener(
                                                                        'focus',
                                                                        cancelledeventlistener);
                                                                setState(() {
                                                                  isLoading3 =
                                                                      false;
                                                                });
                                                              }
                                                            });
                                                          }

                                                          html.window
                                                              .addEventListener(
                                                                  'focus',
                                                                  cancelledeventlistener);
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .shade50,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.8,
                                                            height: 160,
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  isLoading3
                                                                      ? CircularProgressIndicator()
                                                                      : (fileBytes2 ==
                                                                              null)
                                                                          ? (urlimage.toString() == 'null' || urlimage.toString() == '')
                                                                              ? Icon(Icons.add_box_rounded, size: 50, color: Colors.blueGrey[300])
                                                                              : Column(children: [
                                                                                  Image.network(urlimage.toString(), width: 100, height: 90, fit: BoxFit.fill),
                                                                                  SizedBox(height: 2),
                                                                                  Text(
                                                                                    ' ${urlimagename} ',
                                                                                    style: TextStyle(color: Colors.black45, fontSize: 13),
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                ])
                                                                          : ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                topLeft: Radius.circular(8.0),
                                                                                topRight: Radius.circular(8.0),
                                                                              ),
                                                                              child: Column(children: [
                                                                                Image.memory(fileBytes2!, width: 100, height: 90, fit: BoxFit.fill,filterQuality: FilterQuality.low),
                                                                                SizedBox(height: 2),
                                                                                Text(
                                                                                  ' ${_fileName2} ',
                                                                                  style: TextStyle(color: Colors.black45, fontSize: 13),
                                                                                ),
                                                                                SizedBox(height: 2),
                                                                              ]),
                                                                            ),
                                                                  Text(
                                                                      "Choose Image",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.blueGrey))
                                                                ])))
                                                  ]),
                                              SizedBox(
                                                height: 33,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Social Media Details",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ]),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    facebookdetailscontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Facebook",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      Icons.facebook,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    instagramdetailscontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Instagram",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      FontAwesomeIcons
                                                          .instagram,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    linkedindetailscontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "LinkedIn",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      FontAwesomeIcons.linkedin,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    twitterdetailscontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Twitter",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      FontAwesomeIcons.twitter,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              FutureBuilder(
                                                  future: downloadjson_Future,
                                                  builder: (context, snapshot) {
                                                    return IntlPhoneField(
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      disableLengthCheck: true,
                                                      controller:
                                                          whatsappnocontroller,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF505D6E)),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors
                                                            .blueGrey.shade50,
                                                        labelText: "Whatsapp",
                                                        labelStyle: TextStyle(
                                                            color: Colors
                                                                .blueGrey),
                                                      ),
                                                      initialCountryCode:
                                                          // country_whatsappnumber2 =
                                                          updateprofilelist[0]
                                                              .country_whatsappnumber2
                                                              .toString(),
                                                      onCountryChanged:
                                                          (country) {
                                                        print(
                                                            'Country changed to: ' +
                                                                country.name);
                                                        print(
                                                            'Country changed to: ' +
                                                                country.code);
                                                        country_whatsappnumber2 =
                                                            country.code;
                                                      },
                                                    );
                                                  }),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller:
                                                    telegramurlcontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Telegram Url",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      FontAwesomeIcons.telegram,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller: youtubecontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Youtube",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      FontAwesomeIcons.youtube,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                style: TextStyle(
                                                    color: Color(0xFF505D6E)),
                                                controller: pinterestcontroller,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Colors.blueGrey.shade50,
                                                    labelText: "Pinterest",
                                                    labelStyle: TextStyle(
                                                        color: Colors.blueGrey),
                                                    prefixIcon: Icon(
                                                      FontAwesomeIcons
                                                          .pinterest,
                                                      color:
                                                          Colors.blueGrey[300],
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Upload your Business Catalogue or Brochure (jpg, pdf)",
                                                        softWrap: true,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black54,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                  height: 30,
                                                  width: double.infinity,
                                                  color: Colors.blueGrey[50],
                                                  child: isLoading4
                                                      ? SizedBox(
                                                          child: Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                          height: 10.0,
                                                          width: 10.0,
                                                        )
                                                      : _fileName4 != null
                                                          ? Text(
                                                              '      $_fileName4',
                                                              style: TextStyle(
                                                                  height: 1.5,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54),
                                                            )
                                                          : (broucherimage ==
                                                                      null ||
                                                                  broucherimage ==
                                                                      '')
                                                              ? Text(
                                                                  ' No File Chosen',
                                                                  style: TextStyle(
                                                                      height:
                                                                          1.5,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .black54))
                                                              : Text(
                                                                  ' $broucherimage',
                                                                  style: TextStyle(
                                                                      height:
                                                                          1.5,
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black54),
                                                                )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                  child: ElevatedButton(
                                                      child: Text('Choose File',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .blueGrey)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .blueGrey[100],
                                                      ),
                                                      onPressed: () async {
                                                        final uploadInput =
                                                            FileUploadInputElement();
                                                        uploadInput.accept =
                                                            'image/*,application/pdf';
                                                        setState(() {
                                                          isLoading4 = true;
                                                        });
                                                        uploadInput.click();
                                                        uploadInput.onChange
                                                            .listen((e) {
                                                          final filename =
                                                              uploadInput
                                                                  .files?.first;
                                                          final files =
                                                              uploadInput.files;
                                                          if (files!.length ==
                                                              1) {
                                                            final file =
                                                                files[0];
                                                            final reader =
                                                                FileReader();
                                                            reader.onLoadEnd
                                                                .listen(
                                                                    (e) async {
                                                              final bytes = Base64Decoder()
                                                                  .convert(reader
                                                                      .result
                                                                      .toString()
                                                                      .split(
                                                                          ",")
                                                                      .last);
                                                              setState(() {
                                                                if (bytes !=
                                                                    null) {
                                                                  _fileName4 =
                                                                      filename
                                                                          ?.name;
                                                                  print(_fileName4
                                                                      .toString());
                                                                  _fileBytes4 =
                                                                      bytes;
                                                                  updateBytes4 =
                                                                      bytes;
                                                                  if (_fileName4 !=
                                                                      null) {
                                                                    updatebroucher =
                                                                        '1';
                                                                  }
                                                                }
                                                              });
                                                            });
                                                            reader
                                                                .readAsDataUrl(
                                                                    file);
                                                          }
                                                          setState(() {
                                                            isLoading4 = false;
                                                          });
                                                        });
                                                        void
                                                            cancelledeventlistener(
                                                                e) {
                                                          Future.delayed(
                                                              Duration(
                                                                  seconds: 6),
                                                              () {
                                                            if (uploadInput
                                                                .files!
                                                                .isEmpty) {
                                                              html.window
                                                                  .removeEventListener(
                                                                      'focus',
                                                                      cancelledeventlistener);
                                                              setState(() {
                                                                isLoading4 =
                                                                    false;
                                                              });
                                                            }
                                                          });
                                                        }

                                                        html.window
                                                            .addEventListener(
                                                                'focus',
                                                                cancelledeventlistener);
                                                        // FilePickerResult? result =
                                                        //     await FilePicker.platform
                                                        //         .pickFiles(
                                                        //   type: FileType.custom,
                                                        //   allowedExtensions: [
                                                        //     'jpg',
                                                        //     'pdf'
                                                        //   ],
                                                        // );
                                                        // if (result != null) {
                                                        //   setState(()  {
                                                        //     _fileBytes4 =  result.files.single.bytes;
                                                        //     _fileName4 =  result
                                                        //         .files.single.name;
                                                        //   });
                                                        // } else {
                                                        //   // User canceled the picker
                                                        // }
                                                      })),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      "Upload images to create your Gallery (jpg,png)",
                                                      softWrap: true,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black54,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                  height: 30,
                                                  width: double.infinity,
                                                  color: Colors.blueGrey[50],
                                                  child: _fileNames5List
                                                          .isNotEmpty
                                                      ? Text(
                                                          '' +
                                                              _fileNames5List
                                                                  .length
                                                                  .toString() +
                                                              ((int.parse(_fileNames5List
                                                                          .length
                                                                          .toString()) >
                                                                      1)
                                                                  ? ' files'
                                                                  : ' file'),
                                                          style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      : Text(' No File Chosen',
                                                          style: TextStyle(
                                                              height: 1.5,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black54))),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                  child: ElevatedButton(
                                                      child: Text('Choose File',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .blueGrey)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors
                                                            .blueGrey[100],
                                                      ),
                                                      onPressed: () async {
                                                        final input =
                                                            FileUploadInputElement();
                                                        input.accept =
                                                            'image/*';
                                                        input.multiple = true;
                                                        setState(() {
                                                          isLoading5 = true;
                                                        });
                                                        input.click();
                                                        input.onChange
                                                            .listen((e) {
                                                          final files =
                                                              input.files;

                                                          for (var file
                                                              in files!) {
                                                            final reader =
                                                                FileReader();
                                                            reader.onLoadEnd
                                                                .listen(
                                                                    (e) async {
                                                              final bytes = Base64Decoder()
                                                                  .convert(reader
                                                                      .result
                                                                      .toString()
                                                                      .split(
                                                                          ",")
                                                                      .last);
                                                              setState(() {
                                                                if (bytes !=
                                                                    null) {
                                                                  _fileBytes5 =
                                                                      bytes;
                                                                  // updateBytes =
                                                                  //     bytes;
                                                                  _fileName5 =
                                                                      file?.name;
                                                                  _fileNames5List.add(
                                                                      _fileName5
                                                                          .toString());
                                                                  _fileBytesList5
                                                                      .add(
                                                                          _fileBytes5!);
                                                                  print(_fileNames5List
                                                                      .toString());
                                                                }
                                                              });
                                                            });
                                                            reader
                                                                .readAsDataUrl(
                                                                    file);
                                                          }
                                                          setState(() {
                                                            isLoading5 = false;
                                                          });
                                                        });
                                                        void cancelledeventlistener(e) {
                                                          Future.delayed(Duration(seconds: 6), () {
                                                            if (input.files!.isEmpty) {
                                                              html.window.removeEventListener('focus', cancelledeventlistener);
                                                              setState(() {
                                                                isLoading5 = false;
                                                              });
                                                            }
                                                          });
                                                        }

                                                        html.window
                                                            .addEventListener(
                                                            'focus',
                                                            cancelledeventlistener);
                                                        setState(() {});
                                                        // FilePickerResult? result =
                                                        //     await FilePicker.platform
                                                        //         .pickFiles(
                                                        //   type: FileType.custom,
                                                        //   allowedExtensions: [
                                                        //     'jpg',
                                                        //     'png'
                                                        //   ],
                                                        //   allowMultiple:
                                                        //       true, // Allow selecting multiple files
                                                        // );
                                                        //
                                                        // if (result != null) {
                                                        //   setState(() {
                                                        //     for (var file
                                                        //         in result.files) {
                                                        //       _fileBytesList5
                                                        //           .add(file.bytes!);
                                                        //       _fileNames5
                                                        //           .add(file.name);
                                                        //     }
                                                        //   });
                                                        // } else {
                                                        //   // User canceled the picker
                                                        // }
                                                      })),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              FutureBuilder(
                                                  future: multiple_Future,
                                                  builder: (context, snapshot) {
                                                    return snapshot.hasData
                                                        ? GridView.builder(
                                                            shrinkWrap: true,
                                                            itemCount:
                                                                multiplelist
                                                                    .length,
                                                            gridDelegate:
                                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              childAspectRatio: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      1.8),
                                                              // crossAxisSpacing:
                                                              //     10.0,
                                                              // mainAxisSpacing:
                                                              //     4.0
                                                            ),
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return SingleChildScrollView(
                                                                  child: Center(
                                                                      child:
                                                                          Wrap(
                                                                spacing: 7,
                                                                direction: Axis
                                                                    .horizontal,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              2),
                                                                      Image
                                                                          .network(
                                                                        multiplelist[index]
                                                                            .image
                                                                            .toString(),
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            80,
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              3),
                                                                      Container(
                                                                          child:
                                                                              Text(
                                                                        ' ${multiplelist[index].imageindex.toString()} ',
                                                                        softWrap:
                                                                            true,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black45,
                                                                            fontSize: 10),
                                                                      )),
                                                                      SizedBox(
                                                                          height:
                                                                              3),
                                                                      ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.blueGrey[100],
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Deleteimagedata(
                                                                              context,
                                                                              multiplelist[index].id.toString(),
                                                                              index);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Remove Image',
                                                                          style: TextStyle(
                                                                              color: Colors.blueGrey,
                                                                              fontSize: 9),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              3),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )));
                                                            },
                                                          )
                                                        : Text('');
                                                  }),
                                              isLoading5
                                                  ? CircularProgressIndicator()
                                                  :
                                              (_fileBytesList5.isNotEmpty)
                                                  ? Center(
                                                      child: Wrap(
                                                      spacing: 13,
                                                      direction:
                                                          Axis.horizontal,
                                                      children: [
                                                        for (int i = 0;
                                                            i <
                                                                _fileBytesList5
                                                                    .length;
                                                            i++)
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                  height: 2),
                                                              // // Displaying the selected images
                                                              // if (_fileNames5List[i]
                                                              //         .toLowerCase()
                                                              //         .endsWith(
                                                              //             '.jpg') ||
                                                              //     _fileNames5List[i]
                                                              //         .toLowerCase()
                                                              //         .endsWith('.png'))
                                                              Image.memory(
                                                                _fileBytesList5[
                                                                    i],
                                                                width: 80,
                                                                height: 80, filterQuality: FilterQuality.low
                                                              ),
                                                              SizedBox(
                                                                  height: 3),
                                                              Container(
                                                                  child: Text(
                                                                ' ${_fileNames5List[i]} ',
                                                                softWrap: true,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black45,
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                              SizedBox(
                                                                  height: 3),
                                                              ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                          .blueGrey[
                                                                      100],
                                                                ),
                                                                onPressed: () {
                                                                  _removeImage(
                                                                      i);
                                                                },
                                                                child: Text(
                                                                  'Remove Image',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blueGrey,
                                                                      fontSize:
                                                                          9),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 3),
                                                            ],
                                                          ),
                                                      ],
                                                    ))
                                                  : Text(''),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Checkbox(
                                                      value: (value_check
                                                                  .toString() ==
                                                              '1')
                                                          ? true
                                                          : false,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          this.value = value!;
                                                          value_check =
                                                              (value == false)
                                                                  ? 0
                                                                  : 1;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(
                                                        'I agree with all the ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black)),
                                                    TextButton(
                                                      onPressed: () {},
                                                      style: TextButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          minimumSize:
                                                              Size(50, 30),
                                                          tapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          alignment: Alignment
                                                              .centerLeft),
                                                      child: Text('T&C',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xFFCC9B60))),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      child: Text(
                                                          'Save & Update Profile',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors
                                                                  .white)),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFFCC9B60),
                                                      ),
                                                      onPressed: () {
                                                        if (fullnamecontroller
                                                                        .text !=
                                                                    "" &&
                                                                contactnumbercontroller
                                                                        .text !=
                                                                    ""
                                                            // && companynamecontroller
                                                            //     .text != ""&&
                                                            // emailaddresscontroller
                                                            //     .text !=
                                                            //     ""
                                                            ) {
                                                          //setState(() {
                                                          showDialog(
                                                              context: context,
                                                              builder: (context) => Center(
                                                                  child: CircularProgressIndicator()));
                                                          //});
                                                          Insertdata(context);
                                                        }
                                                        // else if (value_check
                                                        //     .toString() ==
                                                        //     "0") {
                                                        //   ScaffoldMessenger.of(
                                                        //       context)
                                                        //       .showSnackBar(
                                                        //       SnackBar(
                                                        //         content: Text(
                                                        //             "Please accept the terms"),
                                                        //       ));
                                                        // }
                                                        else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                                "Please fill all credentials"),
                                                          ));
                                                        }
                                                        //Insertdata(context);
                                                      },
                                                    ),
                                                  ]),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ])),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Powered by FUTURE INFOTECH",
                    style: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
        ));
  }
}

// class LoadingIndicatorDialog {
//   static final LoadingIndicatorDialog _singleton =
//       LoadingIndicatorDialog._internal();
//   late BuildContext _context;
//   bool isDisplayed = false;
//
//   factory LoadingIndicatorDialog() {
//     return _singleton;
//   }
//
//   LoadingIndicatorDialog._internal();
//
//   show(BuildContext context, {String text = 'Loading...'}) {
//     if (isDisplayed) {
//       return;
//     }
//     showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           _context = context;
//           isDisplayed = true;
//           return WillPopScope(
//             onWillPop: () async => false,
//             child: SimpleDialog(
//               backgroundColor: Colors.white,
//               children: [
//                 Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 16, top: 16, right: 16),
//                         child: CircularProgressIndicator(),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Text(text),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         });
//   }
//
//   dismiss() {
//     if (isDisplayed) {
//       Navigator.of(_context).pop();
//       isDisplayed = false;
//     }
//   }
// }
