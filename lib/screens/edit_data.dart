
import 'package:magical_change/riverpod/user_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:magical_change/models/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:assignment_6/screens/start_screen.dart';

class EditUsersScreen extends ConsumerStatefulWidget {
  const EditUsersScreen({
    required this.user,
    required this.title,
    required this.index,
    super.key,
  });

  final User user;
  final int index;
  final String title;

  @override
  _EditUsersScreenState createState() => _EditUsersScreenState();
}

class _EditUsersScreenState extends ConsumerState<EditUsersScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber);
    addressController = TextEditingController(text: widget.user.address);
  }

  @override
  Widget build(BuildContext context) {
    // final userDetails = ref.read(userRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 159, 63),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 225, 177, 177),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/men.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 4,
                  // height: 50,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: nameController,
                    // maxLength: 15,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      } 
                     
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 4,

                  // height: 50,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: emailController,
                    // maxLength: 20,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      else if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)){
                        return 'Enter Valid Email';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 4,
                  // height: 50,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    // maxLength: 12,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Enter your phone number',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                       
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your number';
                      }
                      else if (value.length != 10){
                        return 'Mobile Number must be of 10 digit'; 
                      }
                      else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                        return 'Please enter valid mobile number';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 4,

                  // height: 50,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: addressController,
                    keyboardType: TextInputType.streetAddress,
                    // maxLength: 25,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Enter your address',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 229, 66, 66),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('in submit');

                        if(formKey.currentState!.validate()){
                          // UserProvider userProvider =
                            // Provider.of<UserProvider>(context, listen: false);
                          User newUser = User(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            address: addressController.text,
                            avatar: widget.user.avatar,
                          );

                          ref
                              .read(userRiverpod.notifier)
                              .updateUser(newUser, widget.index);
                          print("crossed update user****");
                       
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              const Color.fromARGB(255, 106, 219, 86),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 








































                          