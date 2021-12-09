import 'package:flutter/material.dart';
import 'package:mynotepad/files.dart';
import 'package:mynotepad/home.dart';

class NotePad extends StatefulWidget {
  String mLine;
  int index;
  NotePad({Key? key, required this.mLine, required this.index})
      : super(key: key);

  @override
  _NotePadState createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  String text = "";
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller = TextEditingController(text: widget.mLine);
    text = widget.mLine;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        actions: [
          MaterialButton(
              onPressed: () {
                setState(() {
                  saveData(widget.index, text);
                });
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                    (route) => false);
              },
              child: Text('Save'))
        ],
      ),
      body: TextField(
        onChanged: (String val) {
          setState(() {
            text = val;
          });
        },
        controller: _controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}

class _text {}
