

import 'package:covid_19/datasource.dart';
import 'package:covid_19/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));
            
          },
                  child: Container(
            padding: EdgeInsets.symmetric(vertical:12,horizontal:10),
            margin: EdgeInsets.symmetric(vertical :5,horizontal :10),
             decoration: BoxDecoration(
          color: primaryBlack,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 10), 
      ),
    ],
             ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FAQs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector (
          onTap: (){
            launch('https://covid19responsefund.org/en/');
          },
                  child: Container(
            padding: EdgeInsets.symmetric(vertical:12,horizontal:10),
            margin: EdgeInsets.symmetric(vertical :5,horizontal :10),
             decoration: BoxDecoration(
          color: primaryBlack,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 10), 
      ),
    ],
             ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DONATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
                onTap: (){
                  launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                },
                  child: Container(
            padding: EdgeInsets.symmetric(vertical:12,horizontal:10),
            margin: EdgeInsets.symmetric(vertical :5,horizontal :10),
             decoration: BoxDecoration(
          color: primaryBlack,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 10), 
      ),
    ],
             ),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MYTHBUSTERS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
