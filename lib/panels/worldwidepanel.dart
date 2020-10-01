import 'package:covid_19/datasource.dart';
import 'package:flutter/material.dart';
class WorldwidePanel extends StatelessWidget {
  final Map worldData ;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return Container(
      


      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(title: 'CONFIRMED',count: worldData['cases'].toString()),
          StatusPanel(title: 'ACTIVE',count: worldData['active'].toString()),
          StatusPanel(title: 'RECOVERED',count: worldData['recovered'].toString()),
          StatusPanel(title: 'DEATHS',count: worldData['deaths'].toString()),
        ],
      ),
      
    );
  }
}
class StatusPanel extends StatelessWidget {
  final String title; 
  final String count;

  const StatusPanel({Key key, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      
      height: 80,
      width: width/2,
      
      margin: EdgeInsets.all(7),
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
      
      
      
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Text(title,
            style: 
            TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
            )
             ,
          ),
          SizedBox(
            height: 10,
          ),
          Text(count,
            style: 
            TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
          )

        ],


      ),
    );
  }
}