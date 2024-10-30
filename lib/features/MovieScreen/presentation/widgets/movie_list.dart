import 'package:newproject/features/MovieScreen/domain/movie_model.dart';
import 'package:newproject/features/MovieScreen/presentation/state/state.dart';
import 'package:newproject/utils/exporter.dart';

class MovieList extends ConsumerWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieProvider = ref.watch(movieListProvider);
    final movieController = ref.read(movieListProvider.notifier);

    return Scaffold(
      body: movieProvider.when(data: (movies) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Movies",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                      onPressed: () async {
                        movieController.refresh();
                      },
                      icon: const Icon(Icons.refresh))
                ],
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => listItem(
                          movies[index],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: movies.length))
          ],
        );
      }, error: (err, stack) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.error,
              size: 28,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(err.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 12,
            ),
            // Text(
            //   stack.toString(),
            //   textAlign: TextAlign.center,
            //   style: Theme.of(context).textTheme.labelSmall,
            // ),
          ],
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }

  ListTile listItem(MovieModel movie) => ListTile(
        title: Text("${movie.title}"),
        leading: movie.poster != null
            ? Image.network(movie.poster ?? "sadsadsad")
            : const Text("N/A"),
        subtitle: Text("${movie.year}"),
        trailing: Text("${movie.runtime}"),
      );
}
