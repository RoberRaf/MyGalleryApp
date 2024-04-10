import 'package:get_it/get_it.dart';
import 'package:hu_task/core/networking/api_service.dart';
import 'package:hu_task/features/gallery/provider/gallery_provider.dart';
import 'package:hu_task/features/login/provider/login_provider.dart';

final di = GetIt.instance;

Future init() async {
  di.registerLazySingleton(() => ApiService());
  di.registerFactory(() => GalleryProvider());
  di.registerFactory(() => LoginProvider());
}
