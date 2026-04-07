import 'package:opengoalz/constants.dart';

class Multiverse {
  final int id;
  final String name;
  final int speed;
  final int seasonNumber;
  final DateTime dateSeasonStart;
  final DateTime dateHandling;
  final DateTime dateSeasonEnd;
  final int weekNumber;
  final int dayNumber;
  final int cashPrinted;
  final DateTime lastRun;
  final String? error;
  final DateTime? dateDelete;

  Multiverse({
    required this.id,
    required this.name,
    required this.speed,
    required this.seasonNumber,
    required this.dateSeasonStart,
    required this.dateHandling,
    required this.dateSeasonEnd,
    required this.weekNumber,
    required this.dayNumber,
    required this.cashPrinted,
    required this.lastRun,
    required this.error,
    required this.dateDelete,
  });

  factory Multiverse.fromMap(Map<String, dynamic> map) {
    return Multiverse(
      id: map['id'],
      name: map['name'],
      speed: map['speed'],
      seasonNumber: map['season_number'],
      dateSeasonStart: DateTime.parse(map['date_season_start']).toLocal(),
      dateHandling: DateTime.parse(map['date_handling']).toLocal(),
      dateSeasonEnd: DateTime.parse(map['date_season_end']).toLocal(),
      weekNumber: map['week_number'],
      dayNumber: map['day_number'],
      cashPrinted: map['cash_printed'],
      lastRun: DateTime.parse(map['last_run']).toLocal(),
      error: map['error'],
      dateDelete: map['date_delete'] != null
          ? DateTime.parse(map['date_delete']).toLocal()
          : null,
    );
  }

  // static Future<Multiverse?> fromId(int id) async {
  //   try {
  //     final map = await supabase
  //         .from('multiverses')
  //         .select()
  //         .eq('id', id)
  //         .maybeSingle();

  //     if (map == null) {
  //       return null;
  //     }

  //     return Multiverse.fromMap(map);
  //   } catch (e) {
  //     print('Error fetching multiverse: $e');
  //     return null;
  //   }
  // }

  /// Use this with StreamBuilder for live updates.
  /// The channel is opened when the stream is listened to and closed
  /// automatically when StreamBuilder disposes (widget leaves the tree).
  static Stream<Multiverse?> streamFromId(int id) {
    return supabase
        .from('multiverses')
        .stream(primaryKey: ['id'])
        .eq('id', id)
        .map((maps) => maps.isNotEmpty ? Multiverse.fromMap(maps.first) : null);
  }
}
