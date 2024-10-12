import 'package:account/main.dart';
import 'package:account/models/transactions.dart';
import 'package:account/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account/provider/transaction_provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            const Spacer(),
            const Text(
              'Hello Friend',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const Spacer(),
            const Icon(Icons.shield, color: Color.fromARGB(255, 255, 255, 255)),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            // เพิ่มรูปภาพสามรูปเรียงติดกัน
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageCard(
                    'https://www.tnnthailand.com/static/details/KUXjUJ3V9o-600.jpeg'),
                const SizedBox(width: 5), // เพิ่มช่องว่างระหว่างรูปภาพ
                _buildImageCard(
                    'https://www.tnnthailand.com/static/details/GZHLWYBW1j-600.webp'),
                const SizedBox(width: 5), // เพิ่มช่องว่างระหว่างรูปภาพ
                _buildImageCard(
                    'https://mintmagth.s3.ap-southeast-1.amazonaws.com/photos/shares/Mint%20People/2023/JAN%202023/Boys%20Planet/63bfa5f74c5ec.jpg'),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // เปลี่ยนเป็นสีที่ต้องการ
              ),
              decoration: const InputDecoration(
                labelText: ' กิจกรรมที่ชอบ',
                labelStyle: TextStyle(
                  color: Colors.black, // สีของ label
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // สีของขอบเมื่อเลือก
                ),
              ),
              autofocus: false,
              controller: titleController,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return 'กรุณากรอกข้อมูล';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // เปลี่ยนเป็นสีที่ต้องการ
              ),
              decoration: const InputDecoration(
                labelText: 'เวลา',
                labelStyle: TextStyle(
                  color: Colors.black, // สีของ label
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // สีของขอบเมื่อเลือก
                ),
              ),
              keyboardType: TextInputType.number,
              controller: amountController,
              validator: (String? input) {
                try {
                  double amount = double.parse(input!);
                  if (amount < 0) {
                    return 'กรุณากรอกข้อมูลมากกว่า 0';
                  }
                } catch (e) {
                  return 'กรุณากรอกข้อมูลเป็นตัวเลข';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text('บันทึก'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // create transaction data object
                  var statement = Transactions(
                    keyID: null,
                    title: titleController.text,
                    amount: double.parse(amountController.text),
                    date: DateTime.now(),
                  );

                  // add transaction data object to provider
                  var provider =
                      Provider.of<TransactionProvider>(context, listen: false);

                  provider.addTransaction(statement);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) {
                        return const MyHomePage();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันเพื่อสร้างการ์ดรูปภาพ
  Widget _buildImageCard(String imageUrl) {
    return Container(
      width: 160, // กำหนดความกว้างของรูปภาพ
      height: 200, // กำหนดความสูงของรูปภาพ
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover, // จัดการรูปภาพให้พอดีกับ Container
        ),
      ),
    );
  }
}
