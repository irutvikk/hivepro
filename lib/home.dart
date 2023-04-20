import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hivehomepage extends StatefulWidget {
  const Hivehomepage({Key? key}) : super(key: key);

  @override
  State<Hivehomepage> createState() => _HivehomepageState();
}

class _HivehomepageState extends State<Hivehomepage> {
  List mylist=[];
  List gotdata=[];
  var v;

final mybox = Hive.box('mylist');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   var bin = mybox.get('data');
   print('bin=======$bin');
    List ll=[22,33,44,55,66];

    adddata(ll);
    gettingdata();

    v=mybox.get('data',defaultValue: []);
    print('after adding values to gotdata======$v');

  }

  Future<void> adddata(List ll) async {
    if(v!=null) {
      await mybox.put('data', ll);
    }
  }

  Future<void> gettingdata() async {
    setState(() {
      gotdata = mybox.get('data',defaultValue: []);
    });
    print('data from box====$gotdata');

    gotdata.addAll([33,55,55,22,11]);
    await mybox.put('data', gotdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        centerTitle: true,
      ),
    );
  }
}
