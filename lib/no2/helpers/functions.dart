import 'package:intl/intl.dart';

/// Returns a String with a date formatted in hh:mm a format.
String formatTime(DateTime time) => DateFormat('hh:mm a').format(time);
