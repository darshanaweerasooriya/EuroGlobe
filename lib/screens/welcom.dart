import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Image.asset(
                "images/imagewelcom.jpg",
                fit: BoxFit.cover,

              ),
            ),
            // Container for the text
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: 400,
                height: 400,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  // Adjust the top padding here
                  child:
                  Column(
                    children: [
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20,),
                                  Container(
                                    width: 130,
                                    height: 130,
                                    color: Colors.black,
                                    child: Image.asset(
                                      "images/eurologo.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "WELCOME !",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  SizedBox(width: 20,),
                                  Text(
                                    "EuroGlobe",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Connecting You to Europe’s Unique Stories and Destinations  ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Dive into Europe’s Vibrant Cultures and Timeless Traditions.",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ],
                              ),


                              SizedBox(height: 30),

                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(Colors.black),
                              ),
                              child: const Text(
                                  "Get Started",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
