import 'package:flutter/material.dart';
import '../../data/faq_service.dart';

class FaqList extends StatefulWidget {
  @override
  _FaqListState createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  List<Faq> faqs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    faqs = await FaqService.loadFaqs();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAQs')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(faqs[index].question),
                  leading: const Icon(Icons.help),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
