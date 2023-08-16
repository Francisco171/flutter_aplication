import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

PageController pageController = PageController(); // vai fazer
int paginaAtual = 0;
int contador = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nubank'),
          backgroundColor: Colors.purple,
          elevation: 70,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Alcione'),
                accountEmail: Text('alcione.borba@alunos.sc.senac.br'),
                currentAccountPicture: CircleAvatar(
                  child: Text('A'),
                ),
              ),
              ListTile(
                title: Text('Minha Conta'),
                subtitle: Text('Dados da sua Conta'),
                trailing: Icon(Icons.money),
                leading: Icon(Icons.money_off),
                onTap: () {},
              )
            ],
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            Center(
              child: Container(
                child: Text(
                  contador.toString(),
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: paginaAtual,
            onTap: (page) {
              pageController.animateToPage(page,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);
              setState(() {
                paginaAtual = page;
              });

              print(paginaAtual);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
            ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  contador--;
                });
                print(contador);
              },
              child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 14,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
                print(contador);
              },
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
