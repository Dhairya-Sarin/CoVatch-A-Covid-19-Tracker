import 'package:covid_19/datasource.dart';
import 'package:flutter/material.dart';

class Search2 extends SearchDelegate{
  final List stateList ;

  Search2(this.stateList);

  
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
   final suggestionList2 = query.isEmpty?stateList:stateList.where((element) => element['state'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList2==null?0:suggestionList2.length,
      itemBuilder: (context,index){
          return Container(
          height:110,
          
          margin: EdgeInsets.symmetric(horizontal:8,vertical:10),
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius : BorderRadius.all(Radius.circular(15)),
            boxShadow: [ BoxShadow(
              color:Colors.grey[300],
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
                    width : 130,
                    height: 110,
                    decoration: BoxDecoration(
        color: primaryBlack,
       borderRadius : BorderRadius.only( bottomLeft : Radius.circular(15),bottomRight: Radius.circular(2),topLeft: Radius.circular(15),topRight: Radius.circular(2)

       ),
       
       boxShadow: [ BoxShadow(
              color:Colors.grey[200],
              blurRadius:10,
              offset: Offset(20, 0),
            ),
            ],
       
       
       
       ),
                    
        
                    padding: EdgeInsets.symmetric(horizontal:5,),
                    child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [ Text(suggestionList2[index]['id'].replaceAll(RegExp('IN-'), ''), 
                      style: TextStyle(
                        fontWeight:FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                        ),
                        ),
                        SizedBox(height : 15,),
                       Text(suggestionList2[index]['state'], 
                      style: TextStyle(
                        fontWeight:FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10,
                        ),
                        ),


                      ],
                    ),
                  ),
                
                  ]
                  //  Container(child: Image.network(stateData[index]['countryInfo']['flag'],height:90,width:100,)),
                    
                  
                ),
              ),
              Expanded(child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    SizedBox(height:10),
                    Text('CONFIRMED : '+ suggestionList2[index]['confirmed'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('ACTIVE : '+ suggestionList2[index]['active'].toString() , 
                    style: TextStyle(
                     color: primaryBlack,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('RECOVERED : '+ suggestionList2[index]['recovered'].toString() , 
                    style: TextStyle(
                     color: Colors.green,
                     fontWeight: FontWeight.bold,
                     fontSize: 12,
                    ),
                    ),
                       Text('DEATHS : '+ suggestionList2[index]['deaths'].toString() , 
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