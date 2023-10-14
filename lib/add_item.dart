import 'package:flutter/material.dart';
import 'package:tasklist_app/func.dart';
import 'package:tasklist_app/viewlist.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();

  static const routeName = '/add';
}

class _AddItemState extends State<AddItem> with Func {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ItemArguments;
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Item - ${args.listname} list",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Task Item'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter item name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(hintText: 'Enter Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter item description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            createItem(args.listid, nameController.text,
                                descriptionController.text, false);
                            Navigator.pushNamed(context, ViewList.routeName,
                                arguments: ViewArguments(
                                    listName: args.listname, id: args.listid));
                          }
                        },
                        child: const Text("Add")))
              ],
            )),
      ),
    );
  }
}

class ItemArguments {
  final String listid;
  final String listname;

  ItemArguments({required this.listid, required this.listname});
}
