import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
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
                      style: TextStyle(
                        fontSize:23,
                        fontWeight: FontWeight.bold ),
                      ),
                  ),
                  // second row
                  Padding(
                    padding: EdgeInsets.only(right:20),
                    child: IconButton(
                      onPressed: () {
                        print('search clicked');
                      },
                      icon: Icon(Icons.search),
                      iconSize: 30,
                    ),
                  ),
                ],
              ),

              // second colmn,replace it with our cards
              SizedBox(height: 8),
              SizedBox(
                width: 466,
                height:255 ,
                child: Card(
                  child: Column(
                    // first column(the image)
                    children: [
                      Image.network('https://media.istockphoto.com/id/1350560575/photo/pair-of-blue-running-sneakers-on-white-background-isolated.jpg?s=612x612&w=0&k=20&c=A3w_a9q3Gz-tWkQL6K00xu7UHdN5LLZefzPDp-wNkSU=',
                      height: 160,
                      width: 466
                
                      ),
                      // second column (the name and price)
                      Row(
                        children: [
                          Text('Derby leather Shoes'),
                          Text('\$120'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Men\'s shoe'),
                          Icon(Icons.star),
                          Text('4.0')
                        ],
                      ),
                
                    ]
                    
                  ),
                ),
              ),
              
            
            
            
            ],
            // the above marks the end of the whole children of the screen
          ),
        ),
      ),
    );
  }
}
