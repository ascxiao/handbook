import 'package:flutter/material.dart';
import '../../data/directory_service.dart';

class DirectoryList extends StatefulWidget {
  @override
  _DirectoryListState createState() => _DirectoryListState();
}

class _DirectoryListState extends State<DirectoryList> {
  List<Directory> directory = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    directory = await DirectoryService.loadDirectories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Office Directory')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: directory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(directory[index].office),
                  leading: const Icon(Icons.phone),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
