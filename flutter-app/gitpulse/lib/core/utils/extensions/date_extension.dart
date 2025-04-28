import 'package:intl/intl.dart';
import 'package:gitpulse/core/constants/app_constants.dart';

extension DateTimeExtension on DateTime {
  DateTime getStartOfDay() {
    return DateTime(year, month, day);
  }

  DateTime getEndOfDay() {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  bool isSameDay(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }

  String getDateOnlyAsString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toChartDate() {
    return DateFormat("MMM dd").format(this);
  }

  bool isDayBefore() {
    var now = DateTime.now();
    return year <= now.year && month <= now.month && day < now.day;
  }

  //This is for showing in UI in format "MM/dd/yyyy";
  String getFormattedDate() {
    return DateFormat(AppConstants.appUiDateFormat).format(this);
  }

  //This is for showing in UI in format "month day year";
  String getMonthYearFormat() {
    return DateFormat(AppConstants.monthYearFormat).format(this);
  }

  String getMonthAndDate() {
    return DateFormat("MMM dd").format(this);
  }

  String getTimeAgo() {
    final today = DateTime.now();
    final difference = today.difference(this);

    if (difference.inDays == 0) {
      return "today";
    } else if (difference.inDays == 1) {
      return "1 day ago";
    } else if (difference.inDays >= 2 && difference.inDays < 7) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays >= 7 && difference.inDays < 14) {
      return "a week ago";
    } else if (difference.inDays >= 14 && difference.inDays < 21) {
      return "2 weeks ago";
    } else if (difference.inDays >= 21 && difference.inDays < 28) {
      return "3 weeks ago";
    } else if (difference.inDays >= 28 && difference.inDays < 60) {
      return "a month ago";
    } else if (difference.inDays >= 60 && difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return "$months months ago";
    } else if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return "$years year${years > 1 ? 's' : ''} ago";
    }

    return "Just now"; // Fallback in case the date is too close
  }
}
