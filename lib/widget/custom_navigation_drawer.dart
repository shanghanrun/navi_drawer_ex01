import 'package:flutter/material.dart';

import '../page/user_page.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const name = 'Sarah Bright';
    const email = 'sarah@naver.com';
    const urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: [
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserPage(
                  name: 'Sarah Bright',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'People',
                    icon: Icons.people,
                    onPressed: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Favorite',
                    icon: Icons.favorite_border,
                    onPressed: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Workflow',
                    icon: Icons.workspaces_outline,
                    onPressed: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Updates',
                    icon: Icons.update,
                    onPressed: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white70),
                  buildMenuItem(
                    text: 'Plugins',
                    icon: Icons.account_tree_outlined,
                    onPressed: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onPressed: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
        // 기존 패딩값에 추가할 때 .add()
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 39, 38, 38))),
                const SizedBox(height: 4),
                Text(email,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 39, 38, 38))),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color.fromRGBO(30, 60, 168, 1),
              child: Icon(Icons.add_comment_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchField() {
    Color color = Colors.white;
    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onPressed,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop(); //현재화면 없애기. 즉 drawer없애기

    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/people');
        break;
      case 1:
        Navigator.of(context).pushNamed('/favorite');
        break;
    }
  }
}
