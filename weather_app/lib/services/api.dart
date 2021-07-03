class API {
  final String apiKey;

  API({required this.apiKey});

  static final String host = 'api.openweathermap.org';
  static final int port = 443;
  static final String _scheme = 'http';
  static final String basePath = '/data/2.5/weather';
  static final Map<String, String> clientParams = {
    'q': 'Lagos',
    'appid': 'de1a1cae911ba88ad6c682f0a2bb7115',
  };
  static final contactHost = 'jsonplaceholder.typicode.com';
  Uri currentWeatherUri() => Uri(
        scheme: _scheme,
        host: host,
        path: basePath,
        queryParameters: clientParams,
      );
}
