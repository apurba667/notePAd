import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mynotepad/files.dart';
import 'package:mynotepad/note_pad.dart';
import 'files.dart';
import 'note_pad.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Future deleteDialog(BuildContext context, String mLine) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Warning'),
            content: Text("Do you want to delete this note!"),
            actions: [
              TextButton(
                  onPressed: () async {
                    setState(() {
                      removeData(mLine);
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: FutureBuilder(
          future: readData(),
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: [
                SliverGrid.count(
                  crossAxisCount: 2,
                  children: [
                    ...datas.map((mLine) {
                      int index =
                          datas.indexWhere((element) => element == mLine);
                      return InkWell(
                        onLongPress: () {
                          deleteDialog(context, mLine);
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotePad(
                                        mLine: mLine,
                                        index: index,
                                      )));
                        },
                        child: Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      offset: Offset(8, 8),
                                      blurRadius: 15)
                                ],
                                color: Colors.lightBlueAccent[100],
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(mLine)),
                      );
                    }).toList(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          addData();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  offset: Offset(8, 8),
                                  blurRadius: 15)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          }),
    ));
  }
}
