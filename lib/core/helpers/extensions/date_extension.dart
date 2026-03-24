import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Returns "Wednesday, 08 May 2023" style string
  String get toFullDateString => DateFormat('EEEE, dd MMM yyyy').format(this);

  /// Returns "yyyy-MM-dd" style string for API
  String get toApiDateString => DateFormat('yyyy-MM-dd').format(this);

  /// Returns short day name "Mon"
  String get toShortDayName => DateFormat('E').format(this);

  /// Returns day number "08"
  String get toDayNumber => DateFormat('dd').format(this);
}

extension StringDateExtension on String? {
  /// Parses the API date string (e.g., "2024-03-18 10:30 AM") and returns a readable date.
  /// If parsing fails, returns the original string or "N/A".
  String get readableDate {
    if (this == null || this!.isEmpty) return 'N/A';
    try {
      final dateTime = _parseDateTime();
      return DateFormat('EEEE, dd MMMM yyyy').format(dateTime);
    } catch (_) {
      return this!;
    }
  }

  /// Extracts the time portion in a clean format (e.g., "10:30 AM").
  String get readableTime {
    if (this == null || this!.isEmpty) return 'N/A';
    try {
      final dateTime = _parseDateTime();
      return DateFormat('hh:mm a').format(dateTime);
    } catch (_) {
      final parts = this!.split(' ');
      if (parts.length >= 2) {
        return '${parts[1]} ${parts.length > 2 ? parts[2] : ""}'.trim();
      }
      return this!;
    }
  }

  DateTime _parseDateTime() {
    try {
      return DateTime.parse(this!);
    } catch (_) {
      return DateFormat("yyyy-MM-dd hh:mm a").parse(this!);
    }
  }
}

