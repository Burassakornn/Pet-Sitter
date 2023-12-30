// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unused_import, camel_case_types, unused_local_variable, must_be_immutable, library_private_types_in_public_api

import 'dart:developer';
import 'package:login/chat/chat_model.dart';
import '../components/style.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../components/pet.dart';
import '../homepage.dart';
import '../service/service.dart';
import '../chat/chat.dart';
import '../wallet/wallet.dart';
import '../components/stringstyle.dart';
import '../components/color.dart';
import '../setting/addowner.dart';
import '../setting/addpet.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Store the current tab index

  // Define the content for each tab
  final List<Widget> _tabViews = [
    // Home tab content
    BlogPage(),
    // Service tab content (Replace with your desired content)
    ServicePage(),
    // Wallet tab content (Replace with your desired content)
    WalletPage(),
    // Profile tab content (Replace with your desired content)
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);

    return Scaffold(
      appBar: buildAppBar(context, store1),
      body: Stack(
        children: [
          _tabViews[_currentIndex], // Display the selected tab content
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color.fromARGB(255, 48, 5, 87),
        height: 50,
        style: TabStyle.reactCircle,
        initialActiveIndex: 0,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Service'),
          TabItem(icon: Icons.wallet, title: 'Wallet'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (int i) {
          // Update the current index when a tab is tapped
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, Store store1) {
    return AppBar(
      title: const Text('Welcome to the Pet Sitter App!'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
            child: badges.Badge(
              borderRadius: BorderRadius.circular(4),
              badgeContent: Text(
                store1.getTotalNoti().toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Define the ProfilePage widget
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      body: Container(
        color: Colors.orange[30],
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color.fromARGB(255, 237, 236, 243),
                elevation: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Image.asset(
                            "images/pic1.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListTile(
                          title: Text("Adam Wilson", style: style1),
                          subtitle: Text('adammwil47@gmail.com', style: style2),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SettingsPage(),
                                ),
                              );
                            },
                          )),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 80, child: Section1()),
                    SizedBox(
                      height: 130.0,
                      child: Section2(),
                    ),
                    Section3(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//===> class: Section2
class Section2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: customers[0].pets.length,
          itemBuilder: (context, index) {
            String name = customers[0].pets[index].name;
            String age = customers[0].pets[index].age.toString();
            String gender = customers[0].pets[index].gender;
            String species = customers[0].pets[index].species;
            String pic = 'images/${customers[0].pets[index].name}.png';
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
                elevation: 5,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipOval(
                            child: Image.asset(
                              pic,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: style4),
                            Text(
                              age,
                              style: style3,
                            ),
                            Text(
                              gender,
                              style: style3,
                            ),
                            Text(
                              species,
                              style: style3,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  } //ef
} //ec

//===> class: Section1
class Section1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Menu(icon: Icons.wallet, text: "balance", amt: 250),
            Menu(icon: Icons.star, text: "point", amt: 15),
            Menu(icon: Icons.person_add, text: "following", amt: 24),
            Menu(icon: Icons.reviews, text: "review", amt: 3),
          ],
        ),
        Positioned(
          bottom: -2,
          right: 0,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 0),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: Colors.deepPurple[300],
            child: Text("View All"),
          ),
        ),
      ],
    );
  }
}

//===> class: Menu
class Menu extends StatelessWidget {
  IconData icon;

  String text;
  double amt;

  Menu({required this.icon, required this.text, required this.amt});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              icon,
            ),
            onPressed: () {
              // do something
            },
          ),
          Text(text),
          Text(amt.toString()),
        ],
      ),
    );
  } //ef
} //ec

//===> class: Section3
class Section3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.deepPurple[200],
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {
                  // do something
                },
              ),
              title: Text("My favourites", style: style5),
            ),
            SizedBox(
              width: 400,
              height: 500,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: customers[0].favourites.length,
                itemBuilder: (BuildContext context, int index) {
                  return PersonWidget(
                      favourite: customers[0].favourites[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  } //ef
}

class PersonWidget extends StatelessWidget {
  Favourite favourite;

  PersonWidget({
    Key? key,
    required this.favourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text1 = "${favourite.name} (${favourite.service})";
    String distance = "${favourite.distance.toString()} miles away";
    String pic = "images/${favourite.pic}";
    String rate = "${favourite.rate.toString()} dollars/night";
    String feedback = "${favourite.feedback.toString()} reviews";

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 100,
          width: 950,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 5,
            child: SizedBox(
              width: 600,
              height: 200,
              child: ListTile(
                leading: ClipOval(
                  child: Image.asset(
                    pic,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(text1, style: style2),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(distance, style: style3),
                    Text(rate, style: style3),
                    Text(feedback, style: style3)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} //ec

List<Customer> customers = [
  Customer(name: "Adam", phone: "1233444", email: "adam@gmail.com", 
  pets: [
    Pet(name: "Mimo", age: 8, gender: "Male", species: "Dog",pic: "images/Mimo.png"),
    Pet(name: "Dada", age: 4, gender: "Female", species: "Dog",pic: "images/Dada.png"),
    Pet(name: "Lucy", age: 3, gender: "FeMale", species: "Dog",pic: "images/Lucy.png"),
    Pet(name: "BunBun", age: 2, gender: "FeMale", species: "Rabbit",pic: "images/BunBun.png"),
    Pet(name: "LuLu", age: 2, gender: "FeMale", species: "Cat",pic: "images/Lulu.png"),
    Pet(name: "Tiny", age: 3, gender: "Male", species: "Cat",pic: "images/BunBun.png"),
  ], 
  favourites: [
    Favourite(
        pic: "vet1.png",
        name: "Patricia Go",
        rate: 25,
        service: "Pet Veterinary Service",
        distance: 0.7,
        feedback: 25),
    Favourite(
        pic: "vet2.png",
        name: "Sophia Lim",
        rate: 22,
        service: "Pet Veterinary Service",
        distance: 0.7,
        feedback: 61),
    Favourite(
        pic: "vet3.png",
        name: "Amit J",
        rate: 22,
        service: "Pet Supplies",
        distance: 0.7,
        feedback: 43)
  ]
  )
];

//class setting page
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Define text editing controllers for the form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            CircleAvatar(
              radius: 80.0, // Adjust the size of the avatar
              backgroundImage: AssetImage(
                  'images/pic1.jpg'), // You can set your profile image here
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to change profile picture
              },
              child: Text('Change Profile Picture'),
            ),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: ListView(
                shrinkWrap:
                    true, // Added this to make the ListView scrollable within the Column
                children: [
                  // Your existing form fields here
                  Padding(
                    padding: const EdgeInsets.fromLTRB(350, 8, 350, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 110, 10, 104), // You can change the border color here
                          width: 1.0, // You can change the border width here
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // You can adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(350, 8, 350, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 110, 10, 104), // You can change the border color here
                          width: 1.0, // You can change the border width here
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // You can adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(350, 8, 350, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 110, 10, 104), // You can change the border color here
                          width: 1.0, // You can change the border width here
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // You can adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(350, 8, 350, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 110, 10, 104), // You can change the border color here
                          width: 1.0, // You can change the border width here
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // You can adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _phonenumController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(350, 8, 350, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 110, 10, 104),  // You can change the border color here
                          width: 1.0, // You can change the border width here
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // You can adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _birthdateController,
                        decoration: InputDecoration(
                          hintText: 'BirthDate',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your BirthDate';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(350, 8, 350, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 110, 10, 104),  // You can change the border color here
                          width: 1.0, // You can change the border width here
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // You can adjust the border radius
                      ),
                      child: TextFormField(
                        controller: _birthdateController,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(500, 8, 500, 8),
                    child: Container(
                      child: ElevatedButton(
  onPressed: () {
    // Navigate to the AddOwnerPage
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddOwnerPage(),
      ),
    );
  },
  child: Text('Add Owner'),
),

                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(500, 8, 500, 8),
                    child: Container(
                      child: ElevatedButton(
  onPressed: () {
    // Navigate to the AddOwnerPage
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPetPage(),
      ),
    );
  },
  child: Text('Add Pet'),
),

                    ),
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(500, 8, 500, 8),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Validate the form
                            if (_formKey.currentState!.validate()) {
                              // Perform your update action here
                              // You can access the entered values using _nameController.text, _emailController.text, etc.
                              // For example, you can print them:
                              print('Name: ${_nameController.text}');
                              print('Email: ${_emailController.text}');
                              print('Password: ${_passwordController.text}');
                              print('Phone Number: ${_phonenumController.text}');
                              print('Birthdate: ${_birthdateController.text}');
                              print('Birthdate: ${_addressController.text}');
                            }
                          },
                          
                          child: Container(
                            width: 80, // Set the desired width
                            height: 40, // Set the desired height
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontSize:
                                        18), // You can adjust the font size here
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phonenumController.dispose();
    _birthdateController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
