import 'package:flutter/foundation.dart';
import 'package:pin_put_example/services/api_key.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
}

enum PageIndex { page1, page2, page3 }

class API {
  API({@required this.apiKey});

  final String apiKey;
  factory API.sandbox() => API(apiKey: APIKey.ncovSandboxKey);

  static final String host = 'api.unsplash.com';
  static final int port = 443;
  static final String _scheme = 'https';
  static final String basePath = 't/nubentos.com/ncovapi/1.0.0';
  static final Map<String, String> clientParams = {
    "client_id": "TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to"
  };
  static final contactHost = 'jsonplaceholder.typicode.com';
  Uri tokenUri() => Uri(
        scheme: _scheme,
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': "client_credential"},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: _scheme,
        host: host,
        port: port,
        path: '$basePath/${_paths[endpoint]}',
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.casesSuspected: 'casesSuspected',
  };

  Uri contactUri() => Uri(scheme: _scheme, host: contactHost, path: '/users');

  Uri pageUri(PageIndex index) => Uri(
        scheme: _scheme,
        host: host,
        path: 'photos',
        queryParameters: {
          "client_id": "TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to",
          "page": _pages[index],
        },
      );

  static Map<PageIndex, String> _pages = {
    PageIndex.page1: '1',
    PageIndex.page2: '2',
    PageIndex.page3: '3',
  };
}
