import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F L U T T E R  B L O C"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            const Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const Text(
              "Keep connect with us",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20.0),
            const TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                hintText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              width: double.infinity,
              height: 70.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "Login Now!",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
