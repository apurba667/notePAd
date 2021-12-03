import 'package:flutter/material.dart';

List<String> datas = [
  """
  Multi String writing 
  """
      """
  Another MultiString example
  """
];

readData() {}
addData() {
  datas.add("""Wriete Here""");
}

removeData(String mLine) {
  datas.remove(mLine);
}

saveData() {}
