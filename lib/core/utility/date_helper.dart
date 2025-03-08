class DateHelper {
  static String toDayMonthYear(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  static String toHourMinuteAmPm(DateTime date) {
    return "${date.hour > 12 ? date.hour - 12 : date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}";
  }
}
