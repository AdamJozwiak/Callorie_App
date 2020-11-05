import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String foodName;
  Map foodData = {};
  List<Map> foodConsumed = List();

  @override
  void initState() {
    foodData = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        elevation: 10.0,
        shadowColor: Colors.grey[600],
        title: Text('Calorie App',
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 3.0,
        )
          ,),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[350],
      body:
        ListView(
          children: [
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text('Summary',
                    style: TextStyle(
                      color: Colors.grey[850],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    child: Text('Calories consumed'),
                  ),
                  SizedBox(height: 20.0),
                  Container(

                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                    labelText: 'Input food name',
                  ),
                    onChanged: (String foodName) {
                      this.foodName = foodName;
                    },
                  ),
                  SizedBox(height: 20.0),
                  FlatButton.icon(
                    onPressed: () async {
                      final data = await Navigator.pushNamed(context, '/loading', arguments: this.foodName);
                      setState(() {
                        foodData = data;
                      });

                      if(foodData != null)
                      {
                        bool isFound = false;
                        for(final i in foodConsumed)
                        {
                          if(i['name'] == foodData['name'])
                          {
                            i['amount'] += 1;
                            isFound = true;
                            break;
                          }
                        }
                        if(!isFound){
                          foodConsumed.add(foodData);
                        }
                      }
                    },
                    icon: Icon(Icons.fastfood),
                    label: Text('Search food info'),
                  ),
                  SizedBox(height: 20.0),
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/consumed', arguments: foodConsumed);
                    },
                    icon: Icon(Icons.fastfood),
                    label: Text('Check your food'),
                  ),
                ],
              ),
            ),
          ),
        ]
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


        },
        child: Icon(Icons.mic),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}
