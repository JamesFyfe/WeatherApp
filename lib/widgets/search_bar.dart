import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/weather_api_providers.dart';
import 'package:weather_app/services/shared_prefs.dart';

class CitySearchBar extends ConsumerWidget {
  const CitySearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController = TextEditingController();

    return TextField(
      controller: searchTextController,
      // onChanged: (query) {
      //   if (query.length >= 3) {
      //     ref.read(searchQueryProvider.notifier).setQuery(query);
      //     ref.read(citySearchProvider(query));
      //   }
      // },
      onSubmitted: (query) {
        ref.read(searchQueryProvider.notifier).setQuery(query);
        ref.read(citySearchProvider(query));
      },
      decoration: InputDecoration(
        hintText: 'Search for a city',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            searchTextController.text = '';
            ref.read(searchQueryProvider.notifier).setQuery('');
          },
        ),
      ),
    );
  }
}

class CitySearchResults extends ConsumerWidget {
  const CitySearchResults({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final citySearchResults = ref.watch(citySearchProvider(searchQuery));
    return citySearchResults.when(
      data: (results) {
        return (results == null || results.isEmpty)
            ? const SizedBox.shrink()
            : Positioned.fill(
                child: Container(
                  color: Colors.black87,
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
                            ref
                                .read(savedLocationsProvider.notifier)
                                .addLocation(coords);
                            ref.read(searchQueryProvider.notifier).setQuery('');
                          },
                        ),
                      );
                    },
                  ),
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
