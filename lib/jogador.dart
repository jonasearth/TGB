import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Jogador extends StatefulWidget {



  @override
  Jog createState() => Jog();

}


class Jog extends State<Jogador> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List data;
  List nome;
  List img;


var send;

  var users;

  String results = "";

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(title: Text('jogadores')),
      body: Container(

        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Digite o nome do jogador..."),
                onSubmitted: (String str) {
                  setState(() {

                    this.getData(str);
                    controller.text = "";
                  });
                },
                controller: controller,
              ),
              Expanded(
                child: new ListView.builder(
                      scrollDirection: Axis.vertical,

                      itemCount: users == null ? 0 : users.length,
                      itemBuilder: (BuildContext context, int index) {


                      return new GestureDetector(
                          onTap: (){
                        print("Container clicked");
                      },
                        child: Container(

                        height: 80,
                        child: Row(

                            children: <Widget>[

                                Image.network(
                                  'https://jonaslee.dev/${users[index]['id']}.jpg',
                                  height: 80,
                                  width: 80,

                                    fit:BoxFit.fill
                                ),

                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[

                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            "Nome: ${users[index]['nome']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "Idade: ${users[index]['nome']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "Posição: ${users[index]['nome']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            "Nome: ${users[index]['nome']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "Idade: ${users[index]['nome']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            "Posição: ${users[index]['nome']}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                      ),
                            ],
                        ),


                      ),
                      );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),

    );
  }



  Future<String> getData(String str) async {
    //we have to wait to get the data so we use 'await'
    send = "[\"${str}\"]";
    http.Response response = await http.get(
      //Uri.encodeFull removes all the dashes or extra characters present in our Uri

        Uri.encodeFull("https://jonaslee.dev/index.php?type=busca&id=2&data=" + send),
        headers: {
          //if your api require key then pass your key here as well e.g "key": "my-long-key"
          "Accept": "application/json"
        }

    );
    setState(() {
      if(response.body == "false"){
        _displaySnackBar(context);
      } else {
        print(send);
        users = jsonDecode(response.body);
        print(users);
      }

    });
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Não foi possivel localizar o jogador!'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


}