import 'package:flutter/material.dart';
import 'package:static_state_management/globals.dart';
import 'package:static_state_management/views/c_screen.dart';

///////////////////////////////////////////////////////////////////////
/// BScreen - This would typically be in another code file     ///
///////////////////////////////////////////////////////////////////////
class BScreen extends StatefulWidget {
  const BScreen({Key? key}) : super(key: key);

  @override
  _BScreenState createState() => _BScreenState();
}

class _BScreenState extends State<BScreen> {
  int localCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'B Screen\nGlobal: ' +
                    globalStatic.counter.toString() +
                    '\nLocal: ' +
                    localCounter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
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
                    child: const Text('Increment local counter')),
                onPressed: () {
                  localCounter++;
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
                      child: const Text('Navigator.push to C Screen')),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CScreen()));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: Container(
                      width: 200,
                      alignment: Alignment.center,
                      child: const Text('Navigator.pop')),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
