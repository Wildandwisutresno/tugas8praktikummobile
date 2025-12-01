import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:p8/themeprovider.dart';
import 'package:p8/username_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<Themeprovider>(context);
    final usernameProvider = Provider.of<UsernameProvider>(context);

    TextEditingController controller =
        TextEditingController(text: usernameProvider.username);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Pengaturan Tema & Username'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Tema
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mode Gelap",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Aktifkan mode gelap",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        )
                      ],
                    ),
                    Switch(
                      value: themeprovider.isDarkMode,
                      onChanged: (value) {
                        themeprovider.toggleTheme(value);
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Card Input Username
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nama Pengguna",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Masukkan nama...",
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surfaceVariant,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          usernameProvider.saveUsername(controller.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Nama pengguna disimpan")),
                          );
                        },
                        child: const Text("Simpan"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Nama Tersimpan
            Center(
              child: Text(
                "Nama kamu: ${usernameProvider.username}",
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
