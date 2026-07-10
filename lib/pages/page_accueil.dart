import 'dart:convert';

import 'package:app_api_rest_boutique/components/end_drawer_perso.dart';
import 'package:app_api_rest_boutique/services/api_services.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  List<Map<String, dynamic>> data = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    final apiServices = ApiServices();
    final result = await apiServices.getData(
      'https://jsonplaceholder.typicode.com/users',
    );

    print(jsonEncode(result));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
      data = List<Map<String, dynamic>>.from(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawerPerso(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Text('Page Accueil'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : data.isNotEmpty
                  ? ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                        thickness: 4,
                      ),
                      itemBuilder: (context, index) {
                        final item = data[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://i.pravatar.cc/150?img=${data[index]['id']}"),
                                radius: 60,
                          ),
                          title: Text(item['name'].toString()),
                          subtitle: Text(item['email'].toString()),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Aucune donnée disponible',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
        ),
      ),
    );
  }
}