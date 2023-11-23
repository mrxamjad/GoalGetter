class TaskX {
  final List<dynamic> notificationsId;
  final String? TaskName;
  final String? descriptions;
  final String? IconsName;
  final int? Interval;
  final String? Timing;

  TaskX({
    required this.notificationsId,
    this.TaskName,
    this.descriptions,
    this.IconsName,
    this.Interval,
    this.Timing,
  });

  String get getName => TaskName!;
  String get getDscriptions => descriptions!;
  String get getIcons => IconsName!;
  int get getintervals => Interval!;
  String get getTiming => Timing!;
  List<dynamic> get getNotifications => notificationsId;

  Map<String, dynamic> toJson() {
    return {
      'getNotifications': notificationsId,
      'getName': TaskName,
      'getDscriptions': descriptions,
      'getNIcons': getIcons,
      'getintervals': Interval,
      'getTiming': Timing,
    };
  }

  factory TaskX.fromJson(Map<String, dynamic> parsedJson) {
    return TaskX(
      notificationsId: parsedJson['getNotifications'],
      Timing: parsedJson['getTiming'],
      Interval: parsedJson['getintervals'],
      descriptions: parsedJson['getDscriptions'],
      TaskName: parsedJson['getName'],
      IconsName: parsedJson['getIcons'],
    );
  }
}
