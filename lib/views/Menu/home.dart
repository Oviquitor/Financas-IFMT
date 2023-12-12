import 'package:financass/common/customDrawer.dart';
import 'package:financass/views/Menu/widgets/FaturaScreen.dart';
import 'package:financass/views/Menu/widgets/card_action_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Financas',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Seja bem-vindo",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 30,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue.shade800,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Saldo',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 252, 252, 252)),
                    ),
                    Text(
                      r'R$ 1.000,00',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardActionWidget(
                      icon: Icons.pix, description: 'teste', onTap: () {}),
                  CardActionWidget(
                      icon: Icons.money_off_csred,
                      description: 'teste',
                      onTap: () {}),
                  CardActionWidget(
                    icon: Icons.credit_card,
                    description: 'Fatura',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InvoicePage()),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Histórico de transações',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 20, 43),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.sync_alt_outlined,
                        color: Colors.blue,
                      ),
                      title: Text('Transferência enviada'),
                      subtitle: Text('Você enviou R\$ 100,00 para Fulaninha'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.sync_alt_outlined,
                        color: Colors.blue,
                      ),
                      title: Text('Transferência enviada'),
                      subtitle: Text('Você enviou R\$ 100,00 para Fulaninha'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
