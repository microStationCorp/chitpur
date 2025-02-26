import 'package:intl/intl.dart';

String formatTimestamp(DateTime timestamp) {
  // Define the desired format
  final DateFormat formatter = DateFormat('HH:mm:ss dd:MM:yy');
  return formatter.format(timestamp);
}