import 'package:flutter/material.dart';

import 'detailpage.dart';
import 'helper/databaseHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //deklarasi variabel databaseHelper
  DatabaseHelper databaseHelper = DatabaseHelper();

  //function getAPi
  // Future getApi() async {
  //   String url = "https://api.escuelajs.co/api/v1/categories";
  //   var response = await client.get(Uri.parse(url));
  //   print(response.body);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getApi();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fetch API",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
          future: databaseHelper.getApi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : Center(child: Text('Loading...'));
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (BuildContext context, int index) {
        String imageUrl = list[index]['image'];
        return GestureDetector(
          onTap: () {
            // print(list[index]['id']);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  list: list,
                  index: index,
                
                
                
                ),
              ),
            );
            // print("test0");
          },
          child: ListTile(
            title: Text(list[index]['name']),
            leading: imageUrl != null ? Image.network(imageUrl) : null,
          ),
        );
      },
    );
  }
}
