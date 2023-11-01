import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/provider/setProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => setprovider(),
      child: MaterialApp(
        title: 'Flutter Counter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  // int counter = 0;

  // void incrementCounter() {
  //   setState(() {
  //     counter++;
  //   });
  // }

  // void decrementCounter() {
  //   setState(() {
  //     counter--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final ingrementValue = Provider.of<setprovider>(context, listen: false);
    print('rebuilding app');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Consumer<setprovider>(builder: (context, data, child) {
              return Text(
                data.counter.toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: ingrementValue.incrementCounter,
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: ingrementValue.decrementCounter,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
