import 'package:flutter/material.dart';
import 'package:instagram_clone/model/usermodel.dart';
import 'package:instagram_clone/providers/newaccountformprovider.dart';
import 'package:provider/provider.dart';

class CreatingAccountForm extends StatefulWidget {
  const CreatingAccountForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatingAccountForm> createState() => _CreatingAccountFormState();
}

class _CreatingAccountFormState extends State<CreatingAccountForm> {
  @override
  Widget build(BuildContext context) {
    final userName = TextEditingController();
    final dob = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating Account"),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: userName,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      }
                      return 'Enter Valid userName';
                    },
                    decoration:
                        InputDecoration(labelText: "Create new username"),
                  ),
                  TextFormField(
                    controller: dob,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      }
                      return 'Enter Valid dob';
                    },
                    decoration: InputDecoration(labelText: "Enter Your DOB"),
                  ),
                  genderSelect(),
                  Consumer<NewAccountFormProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            provider.changeLoadingStatus(true);
                            await UserModel.creatingUserToFirestore(
                              userName: userName.text,
                              dob: dob.text,
                              gender: provider.getGender,
                            );
                            provider.changeLoadingStatus(false);
                          }
                        },
                        child: provider.getIsLoading
                            ? const CircularProgressIndicator()
                            : Text("Create New Account"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderSelect() {
    return Consumer<NewAccountFormProvider>(
      builder: (context, provider, child) {
        return Container(
          child: Row(
            children: [
              Expanded(
                child: Text("Gender"),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      provider.getGender == "M" ? Colors.teal : Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    provider.setGender("M");
                  },
                  child: Text("Male"),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      provider.getGender == "F" ? Colors.teal : Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    provider.setGender("F");
                  },
                  child: Text("Female"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
