import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 230,

              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: 'Email',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: const Icon(Icons.email_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),

              // ignore: prefer_const_constructors
              SizedBox(
                height: 17,

              ),
                TextField(
                      decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      labelText: 'Senha',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: const Icon(Icons.key_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                ],
                )
              )
          ],
          ),
        ],
      )
    );
  }
}
