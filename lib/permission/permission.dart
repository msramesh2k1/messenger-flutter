import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {

  String type = "Denied";

  @override
  void initState() {
    // TODO: implement initState
    print(Permission.contacts.status.isGranted.then((value) => print(value)));
    super.initState();
  }
  
     
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue[100]!.withOpacity(0.3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: NetworkImage(
                                        "https://cdn-icons-png.flaticon.com/128/1250/1250592.png",
                                      ),
                                      height: 30,
                                      width: 30,
                                    ),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contact Permission' ,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Allow contact permission to sync contacts',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                 
                      Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[100]!
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                100,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _getPermission();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Center(
                                                    child: Text(
                                                      'Accept',
                                                      style: GoogleFonts
                                                          .nunitoSans(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                  child: Text(
                                                    'Decline',
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(color: Colors.grey)),
    );
  }

  Future<PermissionStatus> _getPermission() async {
    print("HELLO");
   

    final PermissionStatus permission = await Permission.contacts.status;
    if (permission.isDenied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
    }
    print(permission);
    // if (permission != PermissionStatus.granted &&
    //     permission != PermissionStatus.denied) {
    //
    //   return permissionStatus[Permission.contacts] ??
    //       PermissionStatus.restricted;
    // } else {
    //   return permission;
    // }
    return permission;
  }
}
