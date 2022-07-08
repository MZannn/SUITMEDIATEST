import 'package:dio/dio.dart';
import '../user_model.dart';
class UserApi {
  final _baseUrl = 'https://reqres.in/api/users?page=2';

  Future getAllDataUser() async {
    try {
      final _response = await Dio().get(_baseUrl);
      List<dynamic> _allDataUser = _response.data['data'];
      List<UserModel> _data = [];

      for (var element in _allDataUser) {
        _data.add(UserModel.fromJson(element));
      }

      return _data;
    } catch (e) {
      throw Exception('Failed Get All Data User');
    }
  }
}
