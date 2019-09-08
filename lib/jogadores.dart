import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Jogadores extends StatefulWidget {



  @override
  Jog createState() => Jog();

}


class Jog extends State<Jogadores> {

  List data;
  List nome;
  List img;




  String asd = "";

  String results = "";

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemCount: data == null ? 0 : img.length,
              itemBuilder: (BuildContext context, int index) {

                return Container(

                  height: 80,
                  child: Row(

                      children: <Widget>[

                          Image.network(
                            'http://192.168.1.16/${img[index]}.jpg',
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
                                    "Nome: ${nome[index]}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Idade: ${nome[index]}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Posição: ${nome[index]}",
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
                                    "Nome: ${nome[index]}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Idade: ${nome[index]}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Posição: ${nome[index]}",
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
    http.Response response = await http.get(
      //Uri.encodeFull removes all the dashes or extra characters present in our Uri
        Uri.encodeFull("http://192.168.1.16/index.php?" + str),
        headers: {
          //if your api require key then pass your key here as well e.g "key": "my-long-key"
          "Accept": "application/json"
        }

    );
    setState(() {
      // otem os dados JSON
      asd = json.decode(response.body);
      data = asd.split(",");

      nome = data[0].split("%");
      img = data[1].split("&");


    });
  }




}