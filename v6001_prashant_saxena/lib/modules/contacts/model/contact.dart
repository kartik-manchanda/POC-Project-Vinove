//creating table
final String tableContacts = 'notes';

class Contact {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Contact({
  this.id,
  required this.isImportant,
  required this.number,
  required this.title,
  required this.description,
  required this.createdTime,
  });

  Contact copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Contact(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Contact fromJson(Map<String, Object?> json) => Contact(
    id: json[ContactFields.id] as int?,
    isImportant: json[ContactFields.isImportant] == 1,
    number: json[ContactFields.number] as int,
    title: json[ContactFields.title] as String,
    description: json[ContactFields.description] as String,
    createdTime: DateTime.parse(json[ContactFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    ContactFields.id: id,
    ContactFields.title: title,
    ContactFields.isImportant: isImportant ? 1 : 0, //booleanType have to be converted first
    ContactFields.number: number,
    ContactFields.description: description,
    ContactFields.time: createdTime.toIso8601String(),
  };
}

class ContactFields{

  //all fields
  static final List<String> values = [id, isImportant, number, title, description, time];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

