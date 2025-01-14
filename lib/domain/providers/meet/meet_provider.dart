abstract interface class MeetProvider {
  Future<void> findAll();
  Future<void> create();
  Future<void> update();
  Future<void> delete();
}
