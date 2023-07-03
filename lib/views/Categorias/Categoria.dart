import 'package:fin/common/customDrawer/customDrawer.dart';
import 'package:fin/views/Categorias/components/components.dart';
import 'package:flutter/material.dart';

class Item {
  String title;
  String subtitle;
  IconData? iconData;

  Item(
      {required this.title, required this.subtitle, this.iconData = Icons.add});
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Item> itemList = [];
  String newTitle = '';
  String newSubtitle = '';
  IconData? selectedIcon;

  final List<IconData> iconList = [
    Icons.favorite,
    Icons.star,
    Icons.check_circle_outline,
    Icons.accessibility,
    Icons.emoji_emotions,
    Icons.verified_user,
    Icons.camera_alt,
    Icons.flight_takeoff,
    Icons.music_note,
  ];
  List<Item> filteredList = [];
  @override
  void initState() {
    super.initState();
    filteredList = itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Categorias",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.black, // Defina a cor desejada aqui
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ItemSearchDelegate(filteredList),
              );
            },
          ),
        ],
      ),
      body: filteredList.isEmpty
          ? Center(child: Text("Sem itens adicionados."))
          : ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                Item item = filteredList[index];
                return Card(
                  child: ListTile(
                    leading: Icon(itemList[index].iconData),
                    title: Text(itemList[index].title),
                    subtitle: Text(itemList[index].subtitle),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_rounded),
                          onPressed: () {
                            showInformationDialog1(context, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_rounded),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Confirmar exclusão'),
                                  content: Text(
                                      'Você tem certeza que deseja excluir este item?'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Excluir'),
                                      onPressed: () {
                                        setState(() {
                                          itemList.removeAt(index);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () async {
                    showInformationDialog(context,
                        -1); // -1 indica que é um novo item a ser adicionado
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showInformationDialog1(BuildContext context, int index) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    IconData? selectedIcon = Icons.help;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = itemList[index].title;
        String newSubtitle = itemList[index].subtitle;
        IconData? selectedIcon = itemList[index].iconData;

        return AlertDialog(
          title: Text('Editar item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Título",
                ),
                onChanged: (value) {
                  setState(() {
                    newTitle = value;
                  });
                },
              ),
              TextFormField(
                controller: subtitleController,
                decoration: InputDecoration(
                  hintText: "Subtítulo",
                ),
                onChanged: (value) {
                  setState(() {
                    newSubtitle = value;
                  });
                },
              ),
              DropdownButton<IconData>(
                value: selectedIcon,
                onChanged: (value) {
                  setState(() {
                    selectedIcon = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Icon(Icons.home),
                    value: Icons.help,
                  ),
                  DropdownMenuItem(
                    child: Icon(Icons.person),
                    value: Icons.person,
                  ),
                  DropdownMenuItem(
                    child: Icon(Icons.star),
                    value: Icons.star,
                  ),
                  DropdownMenuItem(
                    child: Icon(Icons.shopping_cart),
                    value: Icons.shopping_cart,
                  ),
                  DropdownMenuItem(
                    child: Icon(Icons.car_repair),
                    value: Icons.car_repair,
                  ),
                  // Adicione outros ícones aqui
                ],
              ),
            ],
          ),
          actions: <Widget>[
            InkWell(
              child: Text('CANCELAR'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            InkWell(
              child: Text('SALVAR'),
              onTap: () {
                setState(() {
                  itemList[index].title = newTitle;
                  itemList[index].subtitle = newSubtitle;
                  itemList[index].iconData = selectedIcon;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showInformationDialog(BuildContext context, int index) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    IconData? selectedIcon = Icons.help;

    if (index >= 0) {
      // Se index >= 0, estamos editando um item existente, então carregamos os dados desse item nos campos do formulário
      Item item = itemList[index];
      titleController.text = item.title;
      subtitleController.text = item.subtitle;
      selectedIcon = item.iconData;
    }

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: "Título",
                  ),
                  onChanged: (value) {
                    setState(() {
                      newTitle = value;
                    });
                  },
                ),
                TextFormField(
                  controller: subtitleController,
                  decoration: InputDecoration(
                    hintText: "Subtítulo",
                  ),
                  onChanged: (value) {
                    setState(() {
                      newSubtitle = value;
                    });
                  },
                ),
                DropdownButton<IconData>(
                  value: selectedIcon,
                  onChanged: (value) {
                    setState(() {
                      selectedIcon = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Icon(Icons.home),
                      value: Icons.help,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.person),
                      value: Icons.person,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.star),
                      value: Icons.star,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.shopping_cart),
                      value: Icons.shopping_cart,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.car_repair),
                      value: Icons.car_repair,
                    ),
                    // Adicione outros ícones aqui
                  ],
                ),
              ],
            ),
          ),
          title: Text('Adiciona novo item'),
          actions: <Widget>[
            InkWell(
              child: Text('CANCELAR'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            InkWell(
              child: Text('ADD'),
              onTap: () {
                Item newItem = Item(
                  title: newTitle,
                  subtitle: newSubtitle,
                  iconData: selectedIcon,
                );
                setState(() {
                  itemList.add(newItem);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
