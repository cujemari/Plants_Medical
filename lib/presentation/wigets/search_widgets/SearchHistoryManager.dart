import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryManager {
  static const _key = 'search_history';

  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> addSearchTerm(String term) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_key) ?? [];

    // Evita duplicados y agrega al inicio
    if (term.trim().isEmpty) return;
    history.remove(term);
    history.insert(0, term);

    // Guarda máximo 10 búsquedas
    if (history.length > 10) history.removeLast();

    await prefs.setStringList(_key, history);
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
