import 'dart:math';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Simple Folding Cell"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.indigo[400],
                Colors.indigo[400],
                Colors.indigo[300],
                Colors.indigo[500],
              ],
            )),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.topCenter,
                    child: SimpleFoldingCell(
                        frontWidget: _frente(),
                        innerTopWidget: _top(),
                        innerBottomWidget: _bottom(),
                        cellSize: Size(MediaQuery.of(context).size.width, 125),
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 6, bottom: 6),
                        animationDuration: Duration(milliseconds: 100),
                        borderRadius: 10,
                        onOpen: () => print('cell opened'),
                        onClose: () => print('cell closed')),
                  );
                })));
  }

  Widget _frente() {
    Random random = Random();
    int dia = random.nextInt(28) + 1;
    int mes = random.nextInt(12) + 1;
    double duration = random.nextInt(12000000).toDouble();
    String data = DateFormat.MMM('pt_BR').format(DateTime.parse(
        '2020-${mes.toString().padLeft(2, '0')}-${dia.toString().padLeft(2, '0')}'));
    final hora = timeFormatter(duration);
    print(data);

    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          SimpleFoldingCellState foldingCellState =
              context.findAncestorStateOfType<SimpleFoldingCellState>();
          foldingCellState?.toggleFold();
          print(foldingCellState);
        },
        child: Container(
          alignment: Alignment.center,
          child: Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.deepPurple,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      dia.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      hora,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Responsável: Fulano de Tal',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87)),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Indicado por: Beltrano',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87)),
                          SizedBox(
                            height: 25,
                          ),
                          _resumo(cor: Colors.black38),
                        ]),
                  )),
            ),
          ]),
        ),
      );
    });
  }

  Widget _top() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          SimpleFoldingCellState foldingCellState =
              context.findAncestorStateOfType<SimpleFoldingCellState>();
          foldingCellState?.toggleFold();
          print(foldingCellState);
        },
        child: Stack(fit: StackFit.passthrough, children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://image.freepik.com/fotos-gratis/fundo-de-textura-preto-escuro_24837-267.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _resumo(cor: Colors.white),
              ],
            ),
          ),
        ]),
      );
    });
  }

  Widget _bottom() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          SimpleFoldingCellState foldingCellState =
              context.findAncestorStateOfType<SimpleFoldingCellState>();
          foldingCellState?.toggleFold();
          print(foldingCellState);
        },
        child: Container(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((10)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            'https://static.makeuseof.com/wp-content/uploads/2015/11/perfect-profile-picture-all-about-face.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Maria das Dores',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              'mdores@gmail.com',
                              style: TextStyle(fontSize: 12),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 200, height: 1, color: Colors.grey),
                            ),
                            Text(
                              '21 1234-5678',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        color: Colors.green,
                        icon: Icon(Icons.phone),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

String timeFormatter(double time) {
  Duration duration = Duration(milliseconds: time.round());

  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(':');
}

Widget _resumo({Color cor}) {
  return Column(children: <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('Duração',
            style: TextStyle(fontWeight: FontWeight.bold, color: cor)),
        SizedBox(
          width: 30,
        ),
        Text('Total',
            style: TextStyle(fontWeight: FontWeight.bold, color: cor)),
        SizedBox(
          width: 30,
        ),
        Text('Avaliação',
            style: TextStyle(fontWeight: FontWeight.bold, color: cor)),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('10m', style: TextStyle(fontWeight: FontWeight.bold, color: cor)),
        Text('R\$ ${1500.00}',
            style: TextStyle(fontWeight: FontWeight.bold, color: cor)),
        Text('9.0', style: TextStyle(fontWeight: FontWeight.bold, color: cor)),
      ],
    )
  ]);
}
