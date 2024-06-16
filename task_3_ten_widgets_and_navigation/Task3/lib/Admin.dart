import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String gender;
  final String university;
  final String department;
  final String semester;
  final String cgpa;
  final String profession;

  const Admin({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.gender,
    required this.university,
    required this.department,
    required this.semester,
    required this.cgpa,
    required this.profession }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AdminPanel'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Name: $name'),
              Text('Email: $email'),
              Text('Phone Number: $phoneNumber'),
              Text('Address: $address'),
              Text('Gender: $gender'),
              Text('University: $university'),
              Text('Department: $department'),
              Text('Semester: $semester'),
              Text('CGPA: $cgpa'),
              Text('Profession: $profession'),

            ],
          ),
        ),
      ),
    );
  }
}
