import 'package:covid_19/datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response = await http
        .get('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  @override
  void initState() { 
    fetchCountryData();
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Country Stats')
      , ),
      body: countryData==null?Center(child:CircularProgressIndicator()): ListView.builder(itemBuilder: (context,index){
        return Container(
          height:130,
          margin: EdgeInsets.symmetric(horizontal:8,vertical:10),
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [ BoxShadow(
              color:Colors.grey[200],
              blurRadius:10,
              offset: Offset(0, 12),
            ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left:5,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(countryData[index]['country'],style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color: primaryBlack,
                    fontSize: 14,
                    ),
                    ),
                   Container(child: Image.network(countryData[index]['countryInfo']['flag'],height:90,width:100,) ,padding: EdgeInsets.only(),),
                    
                  ]
                ),
              ),
              Expanded(child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    SizedBox(height:10),
                    Text('CONFIRMED : '+ countryData[index]['cases'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('ACTIVE : '+ countryData[index]['active'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('RECOVERED : '+ countryData[index]['recovered'].toString() , 
                    style: TextStyle(
                     color: Colors.green,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('DEATHS : '+ countryData[index]['deaths'].toString() , 
                    style: TextStyle(
                     color: Colors.red,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                    SizedBox(height:10),
                    
                  ]
                )
              ),)
            ]
          ),
        );
      },
      
      itemCount: countryData==null?0:countryData.length,
      ),

    );
  }
}
