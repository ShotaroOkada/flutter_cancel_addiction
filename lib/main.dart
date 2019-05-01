import 'package:flutter/material.dart';
import 'package:flutter_cancel_addiction/bloc/selectIconBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final _selectIconBloc = SelectIcon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _selectIconBloc.selectIcon,
          initialData: Icons.sentiment_very_dissatisfied,
          builder: (BuildContext context, AsyncSnapshot<Object> snapshot){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${DateTime.now()}',
                  ),
                  Icon(
                    snapshot.data
                    // style: Theme.of(context).textTheme.display1,
                  ),
                ],
              );
          },
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () => _selectIconBloc.selectIconEventSink.add(Icons.sentiment_satisfied),
        tooltip: 'Increment',
        icon: Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}
