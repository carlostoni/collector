import 'package:flutter/material.dart';

class Person {
  final String name;
  final int id;
  final String photoUrl;
  final bool isActive;
  final String phone;
  final String email;

  Person({required this.name, required this.id, required this.photoUrl, required this.isActive, required this.phone, required this.email});
}

class Collectors extends StatelessWidget {
  final List<Person> persons = [
    Person(name: 'John Doe', id: 1, photoUrl: '', isActive: true, phone: '123456789', email: 'john@example.com'),
    Person(name: 'Jane Smith', id: 2, photoUrl: '', isActive: false, phone: '987654321', email: 'jane@example.com'),
    Person(name: 'Bob Johnson', id: 3, photoUrl: '', isActive: true, phone: '555555555', email: 'bob@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(persons[index].photoUrl),
              ),
              title: Text(persons[index].name),
              subtitle: Text('ID: ${persons[index].id}'),
              trailing: Icon(
                persons[index].isActive ? Icons.check_circle : Icons.remove_circle,
                color: persons[index].isActive ? Colors.green : Colors.red,
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Telefone: ${persons[index].phone}'),
                ),
                ListTile(
                  title: Text('E-mail: ${persons[index].email}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Collectors(),
  ));
}
