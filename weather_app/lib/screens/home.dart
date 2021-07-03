import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/services/api_key.dart';
import 'package:weather_app/services/api_services.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<WeatherData> weatherData;

  @override
  void initState() {
    super.initState();
    final apiService = APIService(API(apiKey: APIKey.weatherKey));
    weatherData = apiService.currentWeatherStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: weatherData,
        builder: (BuildContext context, AsyncSnapshot<WeatherData> snapshot) {
          if (ConnectionState.done == snapshot.connectionState) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    'Something occur while trying to fetch weather data \n ${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              final WeatherData weatherData = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'asset/images/tree.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Currently in ${weatherData.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          weatherData.main.temp.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          weatherData.rain.the1H.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                            title: Text('Temperature'),
                            trailing: Text(
                              weatherData.main.temp.toString() + '\u00B0',
                            ),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.cloud),
                            title: Text('Weather'),
                            trailing: Text(
                              weatherData.weather.first.description.toString() +
                                  '\u00B0',
                            ),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.sun),
                            title: Text(
                              'Humidity',
                            ),
                            trailing: Text(
                              weatherData.main.humidity.toString() + '\u00B0',
                            ),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.wind),
                            title: Text('Wind Speed'),
                            trailing: Text(
                              weatherData.wind.speed.toString() + '\u00B0',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
