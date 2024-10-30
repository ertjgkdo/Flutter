import 'package:newproject/features/MovieScreen/domain/movie_model.dart';
import 'package:newproject/features/MovieScreen/presentation/controller/async_list_controller.dart';
import 'package:newproject/utils/exporter.dart';

final movieListProvider =
    AsyncNotifierProvider<MovieListController, List<MovieModel>>(
        MovieListController.new);
