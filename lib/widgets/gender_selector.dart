import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGenderOption(
          context,
          'Male',
          Icons.male_rounded,
          selectedGender == 'Male',
        ),
        const SizedBox(height: 12),
        _buildGenderOption(
          context,
          'Female',
          Icons.female_rounded,
          selectedGender == 'Female',
        ),
      ],
    );
  }

  Widget _buildGenderOption(
    BuildContext context,
    String gender,
    IconData icon,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () => onGenderSelected(gender),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE63946) : const Color(0xFFF1FAEE),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFE63946)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? Colors.white : const Color(0xFF1D3557),
            ),
            const SizedBox(width: 16),
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF1D3557),
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 24,
              )
            else
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                    width: 2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
