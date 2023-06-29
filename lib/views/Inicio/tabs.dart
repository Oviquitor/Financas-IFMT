import 'package:flutter/material.dart';
import 'package:fin/views/Inicio/pillcards.dart';
import 'package:fin/views/Inicio/pills.dart';


final PageController _pageController = PageController();
changePage(int pageIndex) {
  _pageController.animateToPage(
    pageIndex,
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  Pillcards pillcard = Pillcards();



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pill('Transações', ActionScreen.transacao),
              pill('Últimos Ganhos', ActionScreen.ganhos),
              pill('Últimos Gastos', ActionScreen.gastos),
            ],
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width / 1.1,
          //   height: MediaQuery.of(context).size.height / 3.3,
          //   child: Card(
          //     shadowColor: Colors.black,
          //     child: FutureBuilder(
          //       future: lista,
          //       builder: (context, snapshot) {
          //         if (snapshot.hasData) {
          //           return ListView(
          //             children: [
          //               Container(
          //                 height: MediaQuery.of(context).size.height / 3.3,
          //                 child: PageView(
          //                   controller: _pageController,
          //                   children: [
          //                     pillcard.transacaoCard(),
          //                     pillcard.ganhosCard(),
          //                     pillcard.gastosCard()
          //                   ],
          //                 ),
          //               )
          //             ],
          //           );
          //         } else if (snapshot.hasError) {
          //           return Center(
          //             child: Text(snapshot.error.toString()),
          //           );
          //         } else {
          //           return const Center(
          //             child: CircularProgressIndicator(),
          //           );
          //         }
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
