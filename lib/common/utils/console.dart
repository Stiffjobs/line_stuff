part of utils;

abstract class Console {
  static final _log = Logger(filter: _LogFilter());

  static void log(dynamic message) => _log.d(message);
  static void error(dynamic message) => _log.e(message);
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => !kReleaseMode;
}
