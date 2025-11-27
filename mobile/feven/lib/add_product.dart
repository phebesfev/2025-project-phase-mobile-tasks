import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   leading: BackButton(),
        // ),
        body: SafeArea(
          child:Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  children: [
                    // centered title
                    Center(
                      child: Text(
                        'Add Product',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // back button aligned left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(
                        onPressed: () {
                          print('backbutton clicked');
                        },
                      ),
                    ),
                  ],
                ),
               
              SizedBox(height: 30,),               // container for the image
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 40, color: Colors.black54),
                    SizedBox(height: 10),
                    Text("upload image", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),


              SizedBox(height: 20,), 
              Text('name'),
              SizedBox(height: 5,),
              Container(

                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(height: 20,), 
              Text('Category'),
              SizedBox(height: 5,),
              Container(

                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              SizedBox(height: 20,), 
              Text('Price'),
              SizedBox(height: 5,),
              Container(

                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),


              SizedBox(height: 20,), 
              Text('description'),
              SizedBox(height: 5,),
              Container(

                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),


            ],
          ),


            )
          
          

        ),
      ),
      
    );
  }
}