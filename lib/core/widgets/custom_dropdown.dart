import 'package:flutter/material.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';

/// Custom dropdown widget with consistent styling
class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final String? hintText;
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isLoading;

  const CustomDropdown({
    super.key,
    this.label,
    this.hintText,
    this.value,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    this.validator,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
          ),
          const SizedBox(height: 8),
        ],
        DropdownButtonFormField<T>(
          value: items.contains(value) ? value : null, // Only set value if it exists in items
          isExpanded: true,
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((T item) {
              return Text(
                getLabel(item),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              );
            }).toList();
          },
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                getLabel(item),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          }).toList(),
          onChanged: (isLoading || onChanged == null) ? null : onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: isLoading ? 'Memuat data...' : hintText,
            hintStyle: TextStyle(color: AppColors.subtitleBlue.withOpacity(0.7)),
            filled: true,
            fillColor: AppColors.backgroundLight,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                      ),
                    ),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textLight,
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.4),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
