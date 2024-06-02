import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/providers/weather_api_providers.dart';
import 'package:weather_app/services/shared_prefs.dart';

class SearchBarAndResults extends ConsumerWidget {
  const SearchBarAndResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black54,
      child: const Column(
        children: [
          SearchBar(),
          SearchResults(),
        ],
      ),
    );

    //   final showSearch = ref.watch(showSearchProvider);

    //   return showSearch
    //       ? GestureDetector(
    //           onTap: () {
    //             ref.read(showSearchProvider.notifier).set(false);
    //             ref.read(searchQueryProvider.notifier).setQuery('');
    //             ref.invalidate(citySearchProvider(''));
    //           },
    //           child: Container(
    //             color: Colors.black54,
    //             child: const Column(
    //               children: [
    //                 SearchBar(),
    //                 Expanded(child: SearchResults()),
    //               ],
    //             ),
    //           ),
    //         )
    //       : const SearchBar();
  }
}

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController = TextEditingController();

    return TextField(
      controller: searchTextController,
      // onChanged: (query) {
      //   // ref.read(showSearchProvider.notifier).set(true);
      //   ref.read(searchQueryProvider.notifier).setQuery(query);
      //   if (query.length >= 4) {
      //     ref.invalidate(citySearchProvider(query));
      //   } else {
      //     ref.invalidate(citySearchProvider(''));
      //   }
      // },
      onSubmitted: (query) {
        if (query.length >= 4) {
          ref.read(searchQueryProvider.notifier).setQuery(query);
          ref.read(citySearchProvider(query));
        } else {
          // ref.invalidate(citySearchProvider(''));
        }
      },
      decoration: InputDecoration(
        hintText: 'Search for a city',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            searchTextController.text = '';
            ref.read(searchQueryProvider.notifier).setQuery('');
            // ref.invalidate(citySearchProvider(''));
          },
        ),
      ),
    );
  }
}

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final citySearchResults = ref.watch(citySearchProvider(searchQuery));
    return citySearchResults.when(
      data: (results) {
        return (results == null || results.isEmpty)
            ? const SizedBox.shrink()
            : Container(
                color: Colors.black54,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final city = results[index];
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          city['state'] == null
                              ? '${city['name']}, ${city['country']}'
                              : '${city['name']}, ${city['state']}, ${city['country']}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onTap: () {
                          Coordinates coords = Coordinates(
                              latitude: city['lat'], longitude: city['lon']);
                          SharedPrefs().addSavedLocation(coords);
                          ref.read(searchQueryProvider.notifier).setQuery('');
                        },
                      ),
                    );
                  },
                ),
              );
      },
      loading: () {
        return const SizedBox.shrink();
      },
      error: (error, stackTrace) {
        print('error loading city results for $searchQuery: $error');
        return Text('Error: $error');
      },
    );
  }
}
