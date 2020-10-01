import 'package:covid_19/datasource.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData ;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          // childAspectRatio: ,
        ),
          children :<Widget> [ 
            ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,index){
            
            return Container(
              margin: EdgeInsets.symmetric(horizontal:10,vertical:5.0,),
              child: Row(
                
                children: <Widget>[
                      
                Image.network(countryData[index]['countryInfo']['flag'] ,height: 40,width: 50,),
                SizedBox(width:10,),
                Column(
                  children: [
                    Text(countryData[index]['country'],
                    
                    style: 
                    TextStyle( fontWeight: FontWeight.bold,
                    color: primaryBlack,
                    fontSize: 20,



                    ) ,
                    
                    
                    ),
                    SizedBox(height:2,),
                    Text('Deaths : ' + countryData[index]['deaths'].toString(),
                    
                      style: 
                      TextStyle ( fontWeight: FontWeight.bold,
                      color: primaryBlack,
                      fontSize: 10,
                      
                      
                      ),
                    
                    
                    ),
                  ],
                )






                ],
                



              ),
            );

          },
          itemCount: 4,
          ),
  ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,index){
            
            return Container(
              margin: EdgeInsets.symmetric(horizontal:10,vertical:5.0,),
              child: Row(
                
                children: <Widget>[
                      
                Image.network(countryData[index+4]['countryInfo']['flag'] ,height: 40,width: 50,),
                SizedBox(width:10,),
                Column(
                  children: [
                    Text(countryData[index+4]['country'],
                    
                    style: 
                    TextStyle( fontWeight: FontWeight.bold,
                    color: primaryBlack,
                    fontSize: 20,



                    ) ,
                    
                    
                    ),
                    SizedBox(height:2,),
                    Text('Deaths : ' + countryData[index+4]['deaths'].toString(),
                    
                      style: 
                      TextStyle ( fontWeight: FontWeight.bold,
                      color: primaryBlack,
                      fontSize: 10,
                      
                      
                      ),
                    
                    
                    ),
                  ],
                )






                ],
                



              ),
            );

          },
          itemCount: 4,
          )
      
        
      
          ],
    ),
    );
    

    
  }
}