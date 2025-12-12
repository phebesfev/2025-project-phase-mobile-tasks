import 'dart:math';

import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AppProductState();
}

class _AppProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // back button aligned left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30), // container for the image
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
                      Icon(
                        Icons.image_outlined,
                        size: 40,
                        color: Colors.black54,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "upload image",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Text('name'),

                SizedBox(height: 5),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: 'Enter a name here',
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text('Category'),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller:categoryController ,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: 'Enter a Category here',
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text('Price'),
                SizedBox(height: 5),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: 'Enter a price here',
                    ),
                    // ... other properties
                  ),
                ),

                SizedBox(height: 20),
                Text('description'),
                SizedBox(height: 5),
                Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: 'Enter a Description here ',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    final name = nameController.text.trim();
                    final category = categoryController.text.trim();
                    final price = priceController.text.trim();
                    Navigator.pushNamed(
                      context,
                      '/home',
                      arguments: {
                        'name': name,
                        'category': category,
                        'price': price,
                      },
                    );
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: {
                        'name': name,
                        'category': category,
                        'price': price,
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Center(
                      child: Text(style: TextStyle(color: Colors.white), 'ADD'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      'DELETE',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
