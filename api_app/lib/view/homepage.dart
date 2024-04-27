import 'dart:math';

import 'package:api_app/service/Todos_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Todos_Service _todos_service = Todos_Service();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Todos_Service.todosmodel;
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: getData(context)));
  }

  Widget getData(BuildContext context) {
    TextStyle style =
        const TextStyle(fontSize: 21, fontWeight: FontWeight.w400);
    return FutureBuilder(
      future: _todos_service.getTodos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: Todos_Service.todosmodel.length,
            itemBuilder: (context, index) {
              return ListTile(
                  subtitle: Text(snapshot.data![index].completed.toString()),
                  trailing: snapshot.data![index].completed
                      ? const Icon(Icons.task, color: Colors.green)
                      : const Icon(Icons.task, color: Colors.red),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    child: Text(snapshot.data![index].id.toString()),
                  ),
                  dense: true,
                  title: Text(
                    snapshot.data![index].title,
                    style: style,
                  ));
            },
          );
        } else if (snapshot.hasError) {
          print("HATA ALDIN : ${snapshot.error}");
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
