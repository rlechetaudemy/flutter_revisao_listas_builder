import 'package:flutter/material.dart';
import 'package:flutter_revisao_listas_builder/domain/dog.dart';
import 'package:flutter_revisao_listas_builder/domain/dog_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: _body(),
    );
  }

  _body() {
    Future<List<Dog>> future = DogService.getDogs();

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if(! snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        List<Dog> dogs = snapshot.data;
        return _listView(dogs);
      }
    );
  }

  _listView(List<Dog> dogs) {
    return ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, idx) {
          Dog dog = dogs[idx];

          return _dogView(dog);
        }
    );
  }

  _dogView(Dog dog) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          child: Image.asset(
            "assets/images/${dog.foto}",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.black45),
          child: Text(
            "${dog.nome}",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        )
      ],
    );
  }
}
