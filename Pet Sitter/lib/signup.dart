// signup.dart

// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login/components/scaffold.dart';
import 'package:login/main.dart';


class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  static const signupImage = 'images/signup.jpg'; // Update the image path

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetSitter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color.fromARGB(255, 230, 207, 223),
      ),
      home: Center(
        child: AdaptiveScaffold(
          compact: CompactView(signupImage: signupImage, formKey: _formKey), // Update the image and formKey
          full: FullView(signupImage: signupImage, formKey: _formKey), // Update the image and formKey
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget { // Rename the form class to SignupForm
  const SignupForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.pets_rounded,
                        color: Colors.black,
                        size: 50,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Pet Sitter',
                        maxLines: 20,
                        style: textTheme.headline6!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                color: Color.fromARGB(255, 70, 8, 140),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Glad to see you!',
              style: TextStyle(
                color: Color.fromARGB(255, 42, 10, 94),
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name *',
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email *',
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password *',
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password *',
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Add your signup logic here
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(1024, 60),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyApp(), // Use the correct login page
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
    required this.signupImage, // Update the image property
  }) : super(key: key);

  final String signupImage; // Update the image property

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(signupImage), // Update the image property
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class CompactView extends StatelessWidget {
  const CompactView({
    Key? key,
    required this.signupImage, // Update the image property
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final String signupImage; // Update the image property
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: HeroImage(signupImage: signupImage), // Update the image property
          ),
          SignupForm(formKey: _formKey), // Use the SignupForm here
        ],
      );
    });
  }
}

class FullView extends StatelessWidget {
  const FullView({
    Key? key,
    required this.signupImage, // Update the image property
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final String signupImage; // Update the image property
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Flexible(child: SignupForm(formKey: _formKey)), // Use the SignupForm here
          Flexible(
            child: HeroImage(signupImage: signupImage), // Update the image property
          ),
        ],
      );
    });
  }
}