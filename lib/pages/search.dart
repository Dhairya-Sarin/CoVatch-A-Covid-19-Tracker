



import 'package:covid_19/datasource.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate{
  final List countryList ;

  Search(this.countryList); 
  @override
  List<Widget> buildActions(BuildContext context) {
      
      return [
        IconButton(icon:Icon(Icons.clear), onPressed: (){
          query='';
        }),
      ];
      
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
      Navigator.pop(context);
      });
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
   final suggestionList = query.isEmpty?countryList:countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
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
                  children: <Widget>[Text(suggestionList[index]['country'],style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color: primaryBlack,
                    fontSize: 14,
                    ),
                    ),
                   Container(child: Image.network(suggestionList[index]['countryInfo']['flag'],height:90,width:100,) ,padding: EdgeInsets.only(),),
                    
                  ]
                ),
              ),
              Expanded(child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    SizedBox(height:10),
                    Text('CONFIRMED : '+ suggestionList[index]['cases'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('ACTIVE : '+ suggestionList[index]['active'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('RECOVERED : '+ suggestionList[index]['recovered'].toString() , 
                    style: TextStyle(
                     color: Colors.green,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('DEATHS : '+ suggestionList[index]['deaths'].toString() , 
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

    });
  }

}