class Note {
  Note({required this.txt});
  Note.fromMap(Map<String, Object?> data) {
    id = int.parse(data['id'].toString());
    txt = data['txt'].toString();
  }

  late int id = 0;
  late String txt;
  bool get isEmpty {
    return txt.isEmpty;
  }

  Map<String, Object> toMap() => {'txt': txt};
}
