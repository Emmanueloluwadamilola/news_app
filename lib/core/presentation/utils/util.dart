import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

String formatTime(DateTime date) {
  final now = DateTime.now();
  var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date.toString(), true);
  var dateLocal = dateTime.toLocal();
  final difference = now.difference(dateLocal);
  return timeago.format(now.subtract(difference),
      locale: 'en', allowFromNow: true);
}

String formattedDate(DateTime dateTime) {
  String formattedDate = DateFormat.yMMMMd().format(dateTime);

  return formattedDate;
}

String formattedTime(DateTime dateTime) {
  String formattedTime = DateFormat.Hm().format(dateTime);

  return formattedTime;
}