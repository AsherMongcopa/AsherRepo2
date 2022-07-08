import 'package:flutter/material.dart';
import 'package:static_state_management/globals.dart';
import 'package:static_state_management/views/b_screen.dart';

//////////////////////////////////////////////////////////////////
/// CScreen - This would typically be in another code file     ///
//////////////////////////////////////////////////////////////////
class CScreen extends StatefulWidget {
  const CScreen({Key? key}) : super(key: key);

  @override
  _CScreenState createState() => _CScreenState();
}

class _CScreenState extends State<CScreen> {
  int localCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'C Screen\nGlobal: ' +
                  globalStatic.counter.toString() +
                  '\nLocal: ' +
                  localCounter.toString(),
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
                      child: const Text('Navigator.push to B Screen')),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BScreen()));
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
