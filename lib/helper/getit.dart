import 'package:get_it/get_it.dart';
import 'package:todoapp/core/API/post_api_service.dart';
import 'package:todoapp/core/cubit/post_cubit.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<Client>(Client());
  getIt.registerSingleton<ApiClient>((ApiClient(getIt())));
  getIt.registerSingleton<PostCubit>(PostCubit(getIt()));
}
