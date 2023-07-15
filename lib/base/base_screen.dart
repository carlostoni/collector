import 'package:estoque/collectors/collectors.dart';
import 'package:estoque/qr%20scan/qr_scan.dart';
import 'package:estoque/readings/task_list_screen.dart';
import 'package:estoque/register/register.dart';
import 'package:estoque/tasks/tasks.dart';
import 'package:flutter/material.dart';




class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Readings(),
            Collectors(),
            Qrscan(),
            Register(),
            Tasks(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(176, 174, 199, 211),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(200),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airport_shuttle_outlined),
              label: 'Coletores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: 'Qr Code',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Cadastro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined),
              label: 'Tarefas',
            ),

            
          ],
        ));
  }
}
