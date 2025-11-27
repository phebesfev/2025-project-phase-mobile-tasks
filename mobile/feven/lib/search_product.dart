import 'package:flutter/material.dart';
import 'home.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // the first part will be the stack with title and backbutton
              Stack(
                children: [
                  Center(
                    child: Text('Search Product',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(
                      onPressed: (){
                        print('implement the back button functinality');
                      },
                    ),)
                ],
              ),
              

              // search and fliter
              SizedBox(height: 20,),
              Row(
                children: [

                  // search box
                  
                       Container(
                        height: 50,
                        width: 370,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: 
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Leather",
                                style: TextStyle(color: Colors.grey[700],fontSize: 22),
                              ),
                            ),
                            SizedBox(width: 200,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: BackButton(),

                    ),
                          ],
                        ),
                      ),
                

                  SizedBox(width: 10),

                  // filter button
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.filter_list, color: Colors.white),
                  ),
                ],
              ),


              // our cards
              SizedBox(height: 20,),
               Expanded(
                child: ListView(
                  children: [
                    MyCard(),
                    SizedBox(height: 20),
                    MyCard(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              

              // category
              SizedBox(height: 20,),
              Text('Category'),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)

                ),
              ),

              // price
              SizedBox(height: 20,),
              Text('Price'),
              IgnorePointer(
              child: RangeSlider(
                values: RangeValues(0.1, 0.9),
                onChanged: (values) {},
               
              ),
            ),


              // something I don't know

              // apply
              SizedBox(height: 40,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // border:
                ),
                
                child: Center(child: Text('APPLY',style:TextStyle(color: Colors.white) ,)),
              ),


  

            ],
            

          ), 
        )),
    );
  }
}




