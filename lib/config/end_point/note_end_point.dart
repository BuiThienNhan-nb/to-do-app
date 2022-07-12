class NoteEndPoints {
  static const String addNote = "/note/add-note";

  static String getNotesByUserId(String userId) =>
      "note/$userId/get-note-by-user-id";

  static String updateNote(String noteId) => "/note/$noteId/update";

  static String deleteNote(String noteId) => "/note/$noteId/delete";
}
