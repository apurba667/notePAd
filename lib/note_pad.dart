import 'package:flutter/material.dart';

class NotePad extends StatefulWidget {
  String mLine;
  NotePad({Key? key, required this.mLine}) : super(key: key);

  @override
  _NotePadState createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  String text = "";
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    TextEditingController _controller =
        TextEditingController(text: widget.mLine);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        actions: [MaterialButton(onPressed: () => {}, child: Text('Save'))],
      ),
      body: TextField(
        controller: _controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}
