import 'package:fake_store_app/src/common/models/product_model.dart';
import 'package:fake_store_app/src/common/repositories/api_service_repository.dart';
import 'package:fake_store_app/src/common/services/fake_store_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ApiServiceRepository repository;
  List<ProductModel>? products;
  ProductModel? product;

  @override
  void initState() {
    repository = FakeStoreApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Press FAB to fetch data"),
      ),
      body: Center(
        child: products == null || product == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  final model = products![index];
                  return ProductWidget(
                    title: model.title,
                    description: model.description,
                    image: model.image,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          products = await repository.getAllProduct();
          product = await repository.getProductByID(2);
          setState(() {});
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      leading: Image.network(image),
    );
  }
}
