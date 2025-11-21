import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';

class CategoryStackPage extends StatefulWidget {
  final List<Order> makananList;
  final List<Order> minumanList;

  const CategoryStackPage({
    super.key,
    required this.makananList,
    required this.minumanList,
  });

  @override
  State<CategoryStackPage> createState() => _CategoryStackPageState();
}

class _CategoryStackPageState extends State<CategoryStackPage> {
  String selectedCategory = "makanan"; // default kategori

  @override
  Widget build(BuildContext context) {
    // pilih list berdasarkan kategori aktif
    final listMenu = (selectedCategory == "makanan")
        ? widget.makananList
        : widget.minumanList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori Menu"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ============================
          // STACK KATEGORI
          // ============================
          SizedBox(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: buildCategoryBox("Makanan", "makanan"),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: buildCategoryBox("Minuman", "minuman"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // ============================
          // LIST MENU
          // ============================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: listMenu.length,
              itemBuilder: (context, index) {
                // ✔ Tidak ada onAdd
                return MenuCard(order: listMenu[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================
  // KOTAK KATEGORI TANPA FILE TERPISAH
  // ======================================================
  Widget buildCategoryBox(String label, String value) {
    bool isActive = (selectedCategory == value);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = value; // update kategori
        });
      },
      child: Container(
        width: 150,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
