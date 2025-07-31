class ApiService {
  const ApiService._();

  // server
  static const String server = "caseapi.servicelabs.tech";

  // https
  static const String https = "https";

  // standart headers
  static Map<String, String> headers() => {'Content-Type': 'application/json'};
}
