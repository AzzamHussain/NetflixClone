import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixclone/models/search_model.dart';
import 'package:netflixclone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  Search? search;
  void searchModel(String query) {
    apiServices.getSearchMovies(query).then((results) {
      setState(() {
        search = results;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CupertinoSearchTextField(
            padding: const EdgeInsets.all(10),
            controller: searchController,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
            style: TextStyle(color: Colors.white),
            backgroundColor: Colors.grey.withOpacity(0.3),
            onChanged: (value) {
              if (value.isEmpty) {
              } else {
                searchModel(searchController.text);
              }
            },
          )
        ],
      )),
    );
  }
}