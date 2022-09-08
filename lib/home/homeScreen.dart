import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:  Text(
                                    'T - x - T' ,
                                    style: GoogleFonts.openSans(
                                      fontSize: 30,
                                      // color: Colors.blue[100],
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
        backgroundColor: Colors.blue[100]!.withOpacity(0.3),
      ),
      backgroundColor:Colors.white,
      body: Container(
        

        color: Colors.blue[100]!.withOpacity(0.3),
        
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Container(
            
               decoration: BoxDecoration(
          // color: Colors.blue[100]!.withOpacity(0.4),

  color: Colors.white,          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
        ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                 
                    Container(
                      height: 30,
                      child:  Text(
                                          'Chat Messages' ,
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue[100]!.withOpacity(0.3),
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom:2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              height: 100,
                         

                            ),
                          );
                          
                        }),
                        
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        decoration: BoxDecoration(
          color: Colors.blue[100]!.withOpacity(0.4),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
        )),
      )
    );
    
  }
}