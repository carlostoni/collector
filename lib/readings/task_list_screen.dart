import 'package:flutter/material.dart';

class Task {
  final String name;
  final String status;
  final String imageUrl;
  final String description;

  Task({required this.name, required this.status, required this.imageUrl, required this.description});
}

class Readings extends StatefulWidget {
  @override
  _ReadingsState createState() => _ReadingsState();
}

class _ReadingsState extends State<Readings> {
  final List<Task> tasks = [
    Task(
      name: 'Tarefa 1',
      status: 'Concluída',
      imageUrl: '',
      description:
          'A cegueira também é isto, viver num mundo onde se tenha acabado a esperança.',
    ),
    Task(
      name: 'Tarefa 2',
      status: 'Em progresso',
      imageUrl: '',
      description:
          'Renda-se, como eu me rendi. Mergulhe no que você não conhece como eu mergulhei. Não se preocupe em entender, viver ultrapassa qualquer entendimento.',
    ),
    Task(
      name: 'Tarefa 3',
      status: 'Pendente',
      imageUrl: '',
      description:
          'O correr da vida embrulha tudo, a vida é assim: esquenta e esfria, aperta e daí afrouxa, sossega e depois desinquieta. O que ela quer da gente é coragem.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cards'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implementar ação do botão de filtro
              // Aqui você pode adicionar lógica para exibir um diálogo, navegar para outra tela, etc.
              // Exemplo de ação:
              _filterTasks();
            },
          ),
        ],
      ),
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
                  SizedBox(width: 6),
                  Text(
                    tasks[index].name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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

  void _filterTasks() {
    // Implementar ação do botão de filtro
    // Aqui você pode adicionar lógica para filtrar as tarefas de acordo com algum critério
    // Exemplo de ação:
    setState(() {
      tasks.clear(); // Limpa a lista de tarefas
      // Adiciona as tarefas filtradas
      tasks.addAll([
        Task(
          name: 'Tarefa 4 (Filtrada)',
          status: 'Concluída',
          imageUrl: '',
          description: 'Descrição da Tarefa 4 (Filtrada)',
        ),
        Task(
          name: 'Tarefa 5 (Filtrada)',
          status: 'Em progresso',
          imageUrl: '',
          description: 'Descrição da Tarefa 5 (Filtrada)',
        ),
      ]);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: Readings(),
  ));
}
