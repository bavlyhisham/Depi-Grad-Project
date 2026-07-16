import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.white : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            if (isSelected)
              Container(
                width: 6,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xff004182),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

            if (isSelected) const SizedBox(width: 8),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: const Color(0xff004182),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
