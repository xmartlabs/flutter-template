abstract interface class LocalStorage<Key, Model> {
  Future<Model> putElement(Key key, Model response);

  Future<List<Model>> putAllElements(Map<Key, Model> entries);

  Future<void> deleteElement(Key key);

  Future<void> deleteAllElements();

  Future<Model?> getElement(Key key);

  Stream<Model?> getElementStream(Key key);

  Future<List<Model>> getElements();

  Stream<List<Model>> getElementsStream();
}
