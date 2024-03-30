
import 'package:flutter/material.dart';
import 'package:magical_change/models/user_info.dart';
import 'package:magical_change/screens/start_screen.dart';
import 'package:provider/provider.dart';

class EditUsersScreen extends StatelessWidget {
  EditUsersScreen({
    required this.user,
    required this.title,
    required this.index,
    super.key,
  });

  final User user;
  final int index;
  final String title;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late TextEditingController nameController;
    late TextEditingController emailController;
    late TextEditingController phoneNumberController;
    late TextEditingController addressController;

    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.phoneNumber);
    addressController = TextEditingController(text: user.address);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 159, 63),
        title: Text(title),
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
                  height: 20,
                ),
                Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    
                    controller: nameController,
                    maxLength: 15,
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
                      if(value!.isEmpty ||  value == null){
                        return 'Please enter your name';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: emailController,
                    maxLength: 20,
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
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: phoneNumberController,
                    maxLength: 12,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.blue),
                      // prefixText: '91',
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
                      if(value!.isEmpty ||  value == null){
                        return 'Please enter your number';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: addressController,
                    maxLength: 25,
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
                      if(value!.isEmpty ||  value == null){
                        return 'Please enter your address';
                      }
                      else{
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
                          backgroundColor: const Color.fromARGB(255, 229, 66, 66),
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
                          UserProvider userProvider =
                            Provider.of<UserProvider>(context, listen: false);
            
                        userProvider.updateUser(
                          User(
                            name: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            address: addressController.text,
                            avatar: user.avatar,
                          ),
                          index,
                        );
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
