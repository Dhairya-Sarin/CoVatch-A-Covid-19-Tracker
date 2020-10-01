import 'package:covid_19/datasource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  List stateData;
  fetchStateData() async {
    http.Response response = await http
        .get('https://api.covidindiatracker.com/state_data.json');
    setState(() {
      stateData = jsonDecode(response.body);
    });
  }

  @override
  @override
  void initState() { 
    fetchStateData();
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Statewise Stats')
      , ),
      body: stateData==null?Center(child:CircularProgressIndicator()): ListView.builder(itemBuilder: (context,index){
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Container(
                    width : 110,
                    padding: EdgeInsets.symmetric(horizontal:5,),
                    child: Text(stateData[index]['state'],style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: primaryBlack,
                      fontSize: 14,
                      ),
                      ),
                  ),
                  //  Container(child: Image.network(stateData[index]['countryInfo']['flag'],height:90,width:100,)),
                    
                  ]
                ),
              ),
              Expanded(child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    SizedBox(height:10),
                    Text('CONFIRMED : '+ stateData[index]['confirmed'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('ACTIVE : '+ stateData[index]['active'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('RECOVERED : '+ stateData[index]['recovered'].toString() , 
                    style: TextStyle(
                     color: Colors.green,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('DEATHS : '+ stateData[index]['deaths'].toString() , 
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
      
      itemCount: stateData==null?0:stateData.length,
      ),

    );
  }
}
