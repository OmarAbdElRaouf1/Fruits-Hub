import 'package:flutter/material.dart';
import 'package:fruits_market/core/services/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.leading});
  final String title;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, _) {
        return AppBar(
          centerTitle: true,
          leading: leading,
          actions: [
            IconButton(
              tooltip: ThemeController.instance.isDarkMode
                  ? 'تفعيل الوضع الفاتح'
                  : 'تفعيل الوضع الداكن',
              onPressed: ThemeController.instance.toggleTheme,
              icon: Icon(
                ThemeController.instance.isDarkMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
            ),
          ],
          title: Text(title),
        );
      },
    );
  }
}
