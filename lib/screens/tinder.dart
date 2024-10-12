import 'package:flutter/material.dart';

class TinderScreen extends StatefulWidget {
  const TinderScreen({super.key});

  @override
  State<TinderScreen> createState() => _TinderScreenState();
}

class _TinderScreenState extends State<TinderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Tinder', style: TextStyle(color: Colors.red)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shield, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('คู่ Match ใหม่',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  child:
                      Text('99+', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildMatchCard("assets/user1.jpg"),
                _buildMatchCard("assets/user2.jpg"),
                _buildMatchCard("assets/user3.jpg"),
                _buildMatchCard("assets/user4.jpg"),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          Expanded(
            child: ListView(
              children: [
                _buildChatTile(
                    "Weeraphat", "เพิ่งแอ๊คทีฟไปไม่นานนี้ รีบ Match เลย!"),
                _buildChatTile("เกล", "หนีคนใจร้ายคับ เขาชื่อว่ากีตาร์"),
                _buildChatTile("Lappawat tothet", "Pakaphonnn"),
                _buildChatTile("ARM", "👋"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fireplace), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget _buildMatchCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(String name, String message) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[800],
        radius: 25,
      ),
      title: Text(name, style: const TextStyle(color: Colors.white)),
      subtitle: Text(message, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.check, color: Colors.grey),
    );
  }
}
