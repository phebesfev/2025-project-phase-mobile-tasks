import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          
          children: [
            Image.asset(
              'assets/images/men_shoe.png',
              height: 300,),
            
            Container(
              padding: EdgeInsets.only(top:5,left: 40,right:40),
              child: Column(
                children: [
                  Row(
              children: [
                Text('Men\'s shoe',
                style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
                ),
                SizedBox(width: 320),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 13,),
                Text('4.0',
                style: TextStyle(
                  fontSize: 15
                ),)
              ],
            ),
            SizedBox(height: 16,),
      
            Row(
                children: [
                Text(
                  'Derby leather Shoes',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  
                  ),
                  
                SizedBox(width: 220),
                
                Text(
                  '\$120',
                  style: TextStyle(fontWeight: FontWeight.bold,)
                ),
              ],
            ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            
            Padding(
              padding: EdgeInsets.only(left:40,bottom:20),
              child: Row(
                children: [
                  Text(
                    'Size:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:18 ),)
                ]),
            ),

            
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: ListView(
                  
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizeCard(39),
                    SizeCard(40),

                    // the different blue card
                    Card(
                      color: Colors.blue,
                  
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            '41',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),)),
                      ),


                    SizeCard(42),
                    SizeCard(43),
                    SizeCard(44),
                    SizeCard(45),
                    SizeCard(46),
                    SizeCard(47),
                    
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:20,bottom: 10,left: 40,right: 40),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text('A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance,'),
                    
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child:Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red, // Sets the border color
                                width: 2.0, // Sets the border width
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child:Text('DELETE',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                        )),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child:Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.white,
                                // Sets the border color
                                width: 2.0, // Sets the border width
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child:Text('UPDATE',style: TextStyle(color: Colors.white),)),
                        )),
                        
                      ]
                      
                    ) ,
                    
                    
                
                  ],
                ),
              ),
            )
            
          ],
        )
      ),
      
    );
  }  
}


class SizeCard extends StatelessWidget {
  // const SizeCard({super.key});
  int size;
  SizeCard(this.size);

  @override
  Widget build(BuildContext context) {
    return Card(
                  
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '$size',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),)),
          );
  }
}