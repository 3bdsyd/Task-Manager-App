class AppApi {
  static const String _baseUrl = 'https://dummyjson.com/';
  static const String login = '${_baseUrl}auth/login';
  static const String getTodos = '${_baseUrl}todos/user/';
  static const String postTodo = '${_baseUrl}todos/add';
  static const String editTodo = '${_baseUrl}todos/';
}
