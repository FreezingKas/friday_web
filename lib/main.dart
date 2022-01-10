import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:siri_wave/siri_wave.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      themeMode: ThemeMode.dark,
      title: 'Siri Wave Demo',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _amplitude = 1;
  double _speed = .2;
  final _controller = SiriWaveController();
  Color _currentColor = Colors.white;

  void _changeColor(Color color) {
    _currentColor = color;
    _controller.setColor(color);
  }

  // Widget _buildAmplitudeSlider() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5),
  //     child: SizedBox(
  //       width: 360,
  //       child: Slider(
  //         value: _amplitude,
  //         min: 0,
  //         max: 1,
  //         onChanged: (double value) {
  //           _controller.setAmplitude(value);
  //           _amplitude = value;
  //           setState(() {});
  //         },
  //       ),
  //     ),
  //   );
  // }
  Widget _buildAmplitudeSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: 360,
        child: TextButton(
          child: Text("CHANGE"),
          onPressed: () {
            _controller.setAmplitude(0);
            _amplitude = 0;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildUnPutainDeBoutonDeMort() {
    return TextButton(
      child: Text("CHANGE PUTAIN DE BOUTON DE MORT"),
      onPressed: () {
        _controller.setAmplitude(0);
        _amplitude = 0;
        setState(() {});
      },
    );
  }

  Widget _buildSpeedSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: 360,
        child: Slider(
          value: _speed,
          min: 0,
          max: 1,
          onChanged: (double value) {
            _controller.setSpeed(value);
            _speed = value;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildSiriWave() {
    return Column(
      children: [
        SiriWave(
          controller: _controller,
          options: SiriWaveOptions(
            height: kIsWeb ? 300 : 180,
            width: kIsWeb ? 1000 : 360,
          ),
          style: SiriWaveStyle.ios_9,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Amplitude', style: Theme.of(context).textTheme.headline6),
          _buildUnPutainDeBoutonDeMort(),
          Text('Speed', style: Theme.of(context).textTheme.headline6),
          _buildSpeedSlider(),
          _buildSiriWave(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: kIsWeb,
        title: const Text('Siri Wave Demo'),
      ),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }
}
