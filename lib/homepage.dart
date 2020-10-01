import 'dart:convert';

import 'package:covid_19/pages/countryStats.dart';
import 'package:covid_19/pages/stateStats.dart';
import 'package:covid_19/panels/infoPanel.dart';
import 'package:covid_19/panels/mostaffectedcountries.dart';
import 'package:covid_19/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/datasource.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    setState(() {
      countryData = jsonDecode(response.body);
    });
    
  }
  List stateData;
  fetchStateData() async {
      http.Response response =
        await http.get('https://api.covidindiatracker.com/state_data.json');
    setState(() {
      stateData = jsonDecode(response.body);
    });

  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    fetchStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Covid 19 Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              height: 100,
              color: Colors.white,
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: primaryBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WORLDWIDE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(width:30),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                                      child: Container(
                                        width : 73,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(10, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'REGIONAL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StatePage()));
                    },
                                      child: Container(
                                        width : 73,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(10, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text( 
                          'INDIA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldwidePanel(
                    worldData: worldData,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'MOST AFFECTED COUNTRIES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
            InfoPanel(),
            SizedBox(
              height: 20.0,
            ),
            Center(
                child: Text(
              'STAY SAFE!',
              style: TextStyle( fontWeight: FontWeight.bold,
              color: primaryBlack,


                
              ),
            )),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
