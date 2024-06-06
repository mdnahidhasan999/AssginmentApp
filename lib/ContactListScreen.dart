import 'package:assignmentapp/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactlistscreen extends StatefulWidget {
  const Contactlistscreen({super.key});

  @override
  State<Contactlistscreen> createState() => _ContactlistscreenState();
}

class _ContactlistscreenState extends State<Contactlistscreen> {
  final List<Map<String, String>> FormValues = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  void _addTile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        FormValues.add({
          'Name': _nameController.text,
          'Number': _numberController.text,
        });
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  void _deleteTile(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Confirmation'),
            content: const Text('Are you sure you want to delete this tile?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    FormValues.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              )
            ],
          );
        });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,

        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: AppInputDecoration('Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        decoration: AppInputDecoration('Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: _addTile,
                      child: SuccessButtonChild('Add')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: FormValues.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () => _deleteTile(index),
                            child: Card(
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(FormValues[index]['Name']!),
                                subtitle: Text(FormValues[index]['Number']!),
                                trailing: IconButton(
                                  icon: Icon(Icons.call),
                                  onPressed: () => _makePhoneCall(
                                      FormValues[index]['Number']!),
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
