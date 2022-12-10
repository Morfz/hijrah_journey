import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class TasbihPage extends StatefulWidget {
  @override
  _TasbihPageState createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  final String jumlah = 'beadsCount';
  final String putaran = 'malaCount';
  late SharedPreferences prefs;

  final PageController _controller = PageController(
    viewportFraction: 0.1,
    initialPage: 5,
  );

  int _jumlah = 0;
  int _putaran = 0;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kPrimaryColor,
        title: const Text('Tasbih'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              semanticLabel: 'Reset',
            ),
            onPressed: () {
              _resetEveryThing();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () async {
          _clicked();
          await Vibrate.vibrate();
        },
        onVerticalDragStart: (details) async {
          _clicked();
          await Vibrate.vibrate();
        },
        child: Container(
          color: kBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          _Counter(
                              counter: _putaran, counterName: 'Putaran'),
                          _Counter(
                              counter: _jumlah, counterName: 'Jumlah'),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Container(
                  child: PageView.builder(
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, position) {
                      return Container(
                        child: Image.asset(
                          'assets/bead.png',
                        ),
                      );
                    },
                    itemCount: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadSettings() async {
    prefs = await SharedPreferences.getInstance();
    if (!_isDisposed) {
      setState(() {
        _loadData();
      });
    }
  }

  void _loadData() {
    if (!_isDisposed) {
      setState(() {
        _jumlah = prefs.getInt(jumlah) ?? 0;
        _putaran = prefs.getInt(putaran) ?? 0;
      });
    }
  }

  void _resetEveryThing() {
    prefs.setInt(jumlah, 0);
    prefs.setInt(putaran, 0);
    _loadData();
  }

  void _clicked() {
    if (!_isDisposed) {
      setState(() {
        _jumlah++;
        if (_jumlah > 33) {
          _jumlah = 1;
          _putaran++;
        }
      });
    }
    prefs.setInt(jumlah, _jumlah);
    prefs.setInt(putaran, _putaran);
    int nextPage = _controller.page!.round() + 1;
    _controller.animateToPage(nextPage,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }
}

class _Counter extends StatelessWidget {
  _Counter(
      {Key? key,
        required this.counter,
        this.tsCounter = const TextStyle(
            color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
        required this.counterName,
        this.tsCounterName = const TextStyle(
            color: Colors.black, fontSize: 20, fontStyle: FontStyle.italic)})
      : super(key: key);
  final int counter;
  final TextStyle tsCounter;
  final String counterName;
  final TextStyle tsCounterName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('$counter', style: tsCounter),
        Text('$counterName', style: tsCounterName)
      ],
    );
  }
}