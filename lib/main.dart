import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';

final _firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ContactUs());
}

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Widget _buildName() {
  //   return TextFormField(
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         return "Name is required*";
  //       } else {
  //         return null;
  //       }
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
  //       hintText: 'Enter Your Name',
  //       labelText: 'Name',
  //     ),
  //     controller: nameController,
  //     onChanged: (value) {
  //       fullname = value;
  //     },
  //   );
  // }

  Widget _buildName() {
    return TextFormField(
      autocorrect: false,
      validator: (value) {
        if (value.isEmpty) {
          return "Name is required*";
        }
        if (value.length < 3) {
          return 'User_Name must be atleast 3 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
        border: OutlineInputBorder(),
        hintText: 'Enter Your Name',
        labelText: 'Name',
      ),
      controller: nameController,
      onChanged: (value) {
        fullname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      autocorrect: false,
      validator: (value) {
        if (value.isEmpty) {
          return "Email is required*";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
        border: OutlineInputBorder(),
        hintText: 'Enter Your Email',
        labelText: 'Email',
      ),
      controller: emailController,
      onChanged: (value) {
        email = value;
      },
    );
  }

  Widget _buildquery() {
    return TextFormField(
      autocorrect: false,
      validator: (value) {
        if (value.isEmpty) {
          return "Query is required*";
        }
        return null;
      },
      onSaved: (String name) {
        fullname = name;
      },
      maxLines: 13,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
        border: OutlineInputBorder(),
        hintText: 'Enter Your Query',
      ),
      controller: queryController,
      onChanged: (value) {
        query = value;
      },
    );
  }

  //final enquiryTextController = selectedItemBuilder();
  final enquiryController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final queryController = TextEditingController();

  List<String> enquery = [
    'query1',
    'query2',
    'query3',
    'query4',
  ];

  String enquiry;
  String fullname;
  String email;
  String query;

  // void getMessage() async {
  //   final message = await _firestore.collection('contact_us').get();
  //   print(message.docs);
  //
  //   for (var courses in message.docs) {
  //     print(courses.data());
  //   }
  // }

  // void messageStream() async {
  //   await for (var snapshot in _firestore
  //       .collection('contact_us')
  //       .snapshots(includeMetadataChanges: true)) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopNavigationBar(),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 150.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.mobileAlt,
                                color: Colors.blue,
                                size: 45,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '+9195625895432',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff505050),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Colors.blue,
                                size: 45,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'oceanacademy@gmail.com',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff505050),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Colors.blue,
                                size: 40,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'No. 2, Karuvadikuppam Main Rd, '
                                  'near GINGER HOTEL, Senthamarai Nagar, '
                                  'Muthialpet, Puducherry, 605003',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff505050),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  height: 400,
                                  width: 500,
                                  child: getMap(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 125, top: 100, left: 100),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Contact Form',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff505050),
                                fontSize: 45,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vi'
                              'tae ipsum vitae justo pharetra tempor.'
                              ' Quisque volutpat, nibh vitae',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                  color: Color(0xff505050)),
                            ),
                            SizedBox(height: 30),
                            Text(
                              'This Enquiry is for',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff505050),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(right: 80),
                              child: DropdownSearch(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Enquiry is required*";
                                  } else {
                                    return null;
                                  }
                                },
                                maxHeight: 130,
                                showClearButton: true,
                                label: 'Enquiry',
                                hint: 'Select Your Enquiry',
                                mode: Mode.MENU,
                                showSelectedItem: true,
                                items: [
                                  'enquiry_1',
                                  'enquiry_2',
                                  'enquiry_3',
                                  'enquiry_4'
                                ],
                                onChanged: (value) {
                                  enquiry = value;
                                  print(enquiry);
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              'Full Name',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff505050),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(right: 80),
                              child: _buildName(),
                            ),
                            SizedBox(height: 30),
                            Text(
                              'E-mail Address',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff505050),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.only(right: 80),
                              child: _buildEmail(),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Your Query',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff505050),
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.only(right: 80),
                              child: _buildquery(),
                            ),
                            SizedBox(height: 20),
                            RaisedButton(
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 20, bottom: 20),
                              splashColor: Colors.white24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Color(0xff0091D2),
                              onPressed: () {
                                try {
                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a Snackbar.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Processing Data')));
                                    _formKey.currentState.save();
                                  }

                                  if (_firestore.collection('contact_us').add(
                                        {
                                          'Enquery': enquiry,
                                          'Full_Name': fullname,
                                          'Email': email,
                                          'Query': query,
                                        },
                                      ) !=
                                      null) {
                                    enquiryController.clear();
                                    nameController.clear();
                                    emailController.clear();
                                    queryController.clear();
                                  }
                                } finally {
                                  enquiryController.clear();
                                  nameController.clear();
                                  emailController.clear();
                                  queryController.clear();
                                }
                                // enquiry = null;
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
