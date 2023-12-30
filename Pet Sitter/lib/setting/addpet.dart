import 'package:flutter/material.dart';


class AddPetPage extends StatefulWidget {
  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  // Define text editing controllers for the form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            CircleAvatar(
              radius: 80.0, // Adjust the size of the avatar
              backgroundImage: AssetImage(
                  'images/avatar2.jpg'), // You can set your profile image here
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to change profile picture
              },
              child: Text('Add Profile Picture'),
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
                        controller: _ageController,
                        decoration: InputDecoration(
                          hintText: 'Age',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Age';
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
                        controller: _genderController,
                        decoration: InputDecoration(
                          hintText: 'Gender',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                          border: InputBorder
                              .none, // Remove the default border of TextFormField
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Gender';
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
                        controller: _speciesController,
                        decoration: InputDecoration(
                          hintText: 'Species',
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
                        controller: _weightController,
                        decoration: InputDecoration(
                          hintText: 'Weight(Kg)',
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
                              print('Email: ${_ageController.text}');
                              print('Phone Number: ${_genderController.text}');
                              print('Birthdate: ${_speciesController.text}');
                              print('Birthdate: ${_weightController.text}');
                            }
                          },
                          
                          child: Container(
                            width: 80, // Set the desired width
                            height: 40, // Set the desired height
                            child: Center(
                              child: Text(
                                'Update',
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
    _ageController.dispose();
    _genderController.dispose();
    _speciesController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
