// ignore_for_file: unused_field, unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, avoid_print, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'service_model.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchDemo(),
    );
  }
}

class SearchDemo extends StatefulWidget {
  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    setState(() {
      _searchText = _searchController.text;
    });
    // You can implement your search logic here based on _searchText.
    // For demonstration purposes, we'll just print the search text.
    print("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 225, 241),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius
                ),
                child: Align(
                  alignment:
                      Alignment.bottomCenter, // Align hintText to the center
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.symmetric(horizontal: 13.0),
                      border: InputBorder.none, // Remove the default border
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey,
                        onPressed: _performSearch,
                      ),
                    ),
                    onSubmitted: (_) => _performSearch(),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add some spacing between sections

              // Recent section
              Container(
                // color: Colors.green,
                // height: 400,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Recent",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add vertical spacing here
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align buttons in the center vertically
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10), // Add horizontal spacing here
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your action for the first button here
                                  },
                                  child: Text('Vet for rabbit'),
                                  style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10), // Add horizontal spacing here
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your action for the second button here
                                  },
                                  child: Text('Vet'),
                                  style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10), // Add horizontal spacing here
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your action for the third button here
                                  },
                                  child: Text('Lost-pet service'),
                                  style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Align buttons in the center vertically
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the first button here
                                },
                                child: Text('Pet adoption'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the second button here
                                },
                                child: Text('Daily walk service'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the third button here
                                },
                                child: Text('Take care'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the third button here
                                },
                                child: Text('Pet shower'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align buttons in the center vertically
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10), // Add horizontal spacing here
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your action for the first button here
                                    },
                                    child: Text('Grooming'),
                                    style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10), // Add horizontal spacing here
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your action for the second button here
                                    },
                                    child: Text('Pet sitter'),
                                    style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 133, 116, 138),
                ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //// Near me section
              Container(
                // color: Colors.green,
                // height: 400,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "Near me",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add vertical spacing here
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align buttons in the center vertically
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10), // Add horizontal spacing here
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your action for the first button here
                                  },
                                  child: Text('Vet for dog'),
                                  style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10), // Add horizontal spacing here
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your action for the second button here
                                  },
                                  child: Text('Pet supplies'),
                                  style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Align buttons in the center vertically
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the first button here
                                },
                                child: Text('Pet adoption'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the second button here
                                },
                                child: Text('Pet events'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the third button here
                                },
                                child: Text('Daily walk service'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 10), // Add horizontal spacing here
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your action for the third button here
                                },
                                child: Text('Pet food'),
                                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align buttons in the center vertically
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10), // Add horizontal spacing here
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your action for the first button here
                                    },
                                    child: Text('More'),
                                    style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 6, 131),
                ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Service More section
              Container(
                // color: Colors.green,
                // height: 400,
                    child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(serviceData.length, (index) {
                          return Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              left: 12,
                              right: 5,
                              bottom: 5,
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      radius: 44,
                                      backgroundColor:
                                          Color.fromARGB(255, 248, 225, 241),
                                      child: CircleAvatar(
                                        radius: 41,
                                        backgroundColor:
                                            Color.fromARGB(255, 248, 225, 241),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 38,
                                      backgroundImage: AssetImage(
                                        "${serviceData[index]["img"]}",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(serviceData[index]["name"])
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                )
                ),
            ]
            )
            )
            )
            );
  }
}
