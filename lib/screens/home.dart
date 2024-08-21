import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(

          body:

          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width - 110,
                          height: 50,
                          child: TextField(

                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(Icons.search,color: Colors.black,),
                              hintText: 'Search...',
                              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width:30,),
                    Column(
                      children: [
                        SizedBox(height: 40,width: 5,),
                        Text(
                          "Cancel ",
                          style: TextStyle(
                            color: Colors.blueAccent.shade700,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                    )

                  ],
                )
              ],
            ),
          )
        ) );
  }
}
