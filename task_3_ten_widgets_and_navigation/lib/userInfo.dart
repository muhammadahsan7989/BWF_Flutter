import 'package:flutter/material.dart';
import 'package:untitled/Admin.dart';

class Userinfo extends StatelessWidget {
  const Userinfo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phonenumberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController universityController = TextEditingController();
    TextEditingController departmentController = TextEditingController();
    TextEditingController semesterController = TextEditingController();
    TextEditingController cgpaController = TextEditingController();
    TextEditingController professionController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Credentials')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,vertical: 20),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),

                    )
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: phonenumberController,
                  decoration: InputDecoration(
                      hintText: 'Phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),               SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),               SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                      hintText: 'Gender',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: universityController,
                  decoration: InputDecoration(
                      hintText: 'University',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),               SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: departmentController,
                  decoration: InputDecoration(
                      hintText: 'Department',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),               SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: semesterController,
                  decoration: InputDecoration(
                      hintText: 'Semester',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: cgpaController,
                  decoration: InputDecoration(
                      hintText: 'CGPA',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 90,),
                child: TextFormField(
                  controller: professionController,
                  decoration: InputDecoration(
                      hintText: 'Profession',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Admin(
                  name: nameController.text,
                  email: emailController.text,
                  phoneNumber: phonenumberController.text,
                  address: addressController.text,
                  gender: genderController.text,
                  university: universityController.text,
                  department: departmentController.text,
                  semester: semesterController.text,
                  cgpa: cgpaController.text,
                  profession: professionController.text,

                )));
              },
              child: Text('Login', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),


            ],
          ),
        ),
      ),
    );
  }
}
