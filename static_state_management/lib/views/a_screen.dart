import 'package:flutter/material.dart';
import 'package:static_state_management/globals.dart';
import 'package:static_state_management/views/b_screen.dart';

///////////////////////////////////////////////////////////////////////
/// AScreen - This would typically be in another code file      ///
///////////////////////////////////////////////////////////////////////
class AScreen extends StatefulWidget {
  const AScreen({Key? key}) : super(key: key);

  @override
  _AScreenState createState() => _AScreenState();
}

class _AScreenState extends State<AScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'A Screen\nGlobal: ' + globalStatic.counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Container(
                    width: 200,
                    alignment: Alignment.center,
                    child: const Text('Increment global counter')),
                  onPressed: () {
                    globalStatic.incrementCounter();
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Container(
                    width: 200,
                    alignment: Alignment.center,
                    child: const Text('Navigator.push to B Screen')),
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BScreen()));
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
