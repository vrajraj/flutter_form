import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  List<String> agama=["vishwamitri/satellite road/gsrtc","ambaji/himatnagar chokdi/gsrtc", "vishwamirtri/gandhinagar-GEB/gsrtc"];
  String _agama="vishwamitri/satellite road/gsrtc";

  String _jk="100 RS";

  TextEditingController controllerNama= new TextEditingController();
  TextEditingController controllerPass= new TextEditingController();
  TextEditingController controllerMoto= new TextEditingController();


  void _pilihJk(String value){
    setState((){
      _jk=value;
    });
  }

  void  pilihAgama(String value){
    setState((){
      _agama=value;
    });
  }

  void Popupdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("FROM : ${controllerNama.text}"),
            new Text("TO : ${controllerPass.text}"),
            new Text("STAND : ${controllerMoto.text}"),
            new Text("TICKET FAIR : $_jk"),
            new Text("BUS AVAILABLE : $_agama"),
            new RaisedButton(
              child: new Text("OK"),
              onPressed: (){
                Navigator.push(context,
                  new  MaterialPageRoute(builder: (context) => new Screen3()),
                );
              },
            )
          ],
        ),
      ),
    );
    showDialog(context: context,child:alertDialog );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("yarta.com"),
        backgroundColor: Colors.redAccent,

      ),


      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child:  new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Origin",
                      labelText: "FROM",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )

                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller: controllerPass,
                  decoration: new InputDecoration(
                      hintText: "Destination",
                      labelText: "TO",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )

                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                new TextField(
                  controller:  controllerMoto,
                  maxLines: 3,
                  decoration: new InputDecoration(
                      hintText: "Select your stand",
                      labelText: "STAND",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)
                      )

                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),

                new RadioListTile(
                  value: "100 RS",
                  title: new Text(" Government"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Select as government buses -gsrtc,rsrtc,msrtc"),

                ),
                new RadioListTile(
                  value: "120 RS",
                  title: new Text("Private "),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Select as private travelers buses"),

                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),


                new Row(
                  children: <Widget>[
                    new Text("BUS AVAILABLE ",style: new TextStyle(fontSize: 18.0,color: Colors.blue),),
                    new DropdownButton(
                      onChanged: (String value){
                        pilihAgama(value);
                      },
                      value: _agama,
                      items: agama.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),

                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.red,
                  onPressed: (){Popupdata();},
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Text("Redirecting to paytm......."),
    );
  }
}
