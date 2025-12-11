import 'package:feven/pages/add_product.dart';
import 'package:feven/pages/details.dart';
import 'package:feven/pages/search_product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final len = 4;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      String name = args?['name'] ?? 'Default Name';
      String category = args?['category'] ?? 'Default Category';
      String price = args?['price'] ?? '0';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://plus.unsplash.com/premium_photo-1668800128890-bc8d2bf9af7e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170',

                    width: 50,

                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'July14,2023',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Yohannes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            actions: [
              IconButton(
                onPressed: () {
                  print('icon clicked');
                },
                icon: Icon(Icons.notifications_none, size: 30),
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            // first column
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                // first row
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Availabe Products',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                // second row
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: IconButton(
                    // navigate to search page
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    icon: Icon(Icons.search),
                    iconSize: 30,
                  ),
                ),
              ],
            ),

            // SizedBox(height: 8),

            //our cards
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  MyCard(name,category,price),
                  SizedBox(height: 8),
                  MyCard(name,category,price),
                  SizedBox(height: 8),
                  MyCard(name,category,price),
                ],

                // padding: EdgeInsets.all(2),
                // itemCount: len,
                // itemBuilder: (BuildContext context, int index) {
                //   return  ;

                // }
              ),
            ),
          ],
          // the above marks the end of the whole children of the screen
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final name;
  final category;
  final price;
  
  const MyCard(this.name,this.category,this.price);


  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      // I used inkwell so that I can use ontap functions on my card
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: SizedBox(
        child: Card(
          child: Column(
            // first column(the image)
            children: [
              Image.asset(
                'assets/images/men_shoe.png',
                height: 140,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              // second column (the name and price)
              Container(
                padding: EdgeInsets.all(13),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '$name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(width: 217),

                        Text(
                          '$price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),

                    Row(
                      children: [
                        Text(
                          '$category',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        SizedBox(width: 325),
                        Icon(Icons.star, color: Colors.amber, size: 13),
                        Text('4.0', style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
