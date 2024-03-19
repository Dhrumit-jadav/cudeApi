import 'package:crud_api/AddEditUser.dart';
import 'package:crud_api/myapi.dart';
import 'package:flutter/material.dart';

class Api_home extends StatefulWidget {
  const Api_home({super.key});

  @override
  State<Api_home> createState() => _Api_homeState();
}

class _Api_homeState extends State<Api_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return AddEditPage(
                    map: null,
                  );
                },
              )).then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List>(
        future: MyApi().getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(snapshot.data![index]["Firstname"]),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return AddEditPage(map: snapshot.data![index]);
                              },
                            )).then((value) {
                              setState(() {});
                            });
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await MyApi()
                                .deleteUser(snapshot.data![index]["id"]);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

// else if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(
// child: Column(
// children: [
// Text(
// "else if sec exec",
// style: TextStyle(fontSize: 50.0),
// ),
// CircularProgressIndicator(),
// ],
// ),
// );
// }
