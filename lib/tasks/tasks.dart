import 'package:flutter/material.dart';

class Task {
  final String name;
  final String status;
  final String imageUrl;
  final String description;

  Task({required this.name, required this.status, required this.imageUrl, required this.description});
}

class Tasks extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      name: 'Tarefa 1',
      status: 'Concluída',
      imageUrl: '',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    Task(
      name: 'Tarefa 2',
      status: 'Em progresso',
      imageUrl: '',
      description:
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    ),
    Task(
      name: 'Tarefa 3',
      status: 'Pendente',
      imageUrl: '',
      description:
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              leading: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(tasks[index].imageUrl),
                  ),
                ),
              ),
              title: Row(
                children: [
                  Icon(
                    _getStatusIcon(tasks[index].status),
                    color: _getStatusColor(tasks[index].status),
                  ),
                  SizedBox(width: 8),
                  Text(
                    tasks[index].name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Text(tasks[index].status),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          tasks[index].description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Concluída':
        return Icons.check_circle;
      case 'Em progresso':
        return Icons.access_time;
      case 'Pendente':
        return Icons.error;
      default:
        return Icons.info;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Concluída':
        return Colors.green;
      case 'Em progresso':
        return Colors.yellow;
      case 'Pendente':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Tasks(),
  ));
}
