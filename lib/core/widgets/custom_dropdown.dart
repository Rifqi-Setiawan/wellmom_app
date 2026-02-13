import 'package:flutter/material.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';

/// Professional custom dropdown widget with enhanced UX
/// 
/// Features:
/// - Consistent styling across the app
/// - Loading state support
/// - Error state styling
/// - Disabled state styling
/// - Smooth hover interactions
/// - Professional elevation and shadows
class CustomDropdown<T> extends StatefulWidget {
  final String? label;
  final String? hintText;
  final T? value;
  final List<T> items;
  final String Function(T) getLabel;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isLoading;
  final Widget? prefixIcon;

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
    this.prefixIcon,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  fontSize: 14,
                ),
          ),
          const SizedBox(height: 8),
        ],
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.primaryBlue.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: DropdownButtonFormField<T>(
              initialValue: widget.items.contains(widget.value) ? widget.value : null,
              isExpanded: true,
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              icon: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                      ),
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textLight,
                      size: 24,
                    ),
              menuMaxHeight: 300,
              selectedItemBuilder: (BuildContext context) {
                return widget.items.map<Widget>((T item) {
                  return Row(
                    children: [
                      if (widget.prefixIcon != null) ...[
                        widget.prefixIcon!,
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Text(
                          widget.getLabel(item),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDark,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
              items: widget.items.map((T item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        if (widget.prefixIcon != null) ...[
                          widget.prefixIcon!,
                          const SizedBox(width: 12),
                        ],
                        Expanded(
                          child: Text(
                            widget.getLabel(item),
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColors.textDark,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (widget.isLoading || widget.onChanged == null) ? null : widget.onChanged,
              validator: widget.validator,
              decoration: InputDecoration(
                hintText: widget.isLoading ? 'Memuat data...' : widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.subtitleBlue.withOpacity(0.6),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                filled: true,
                fillColor: widget.isLoading 
                    ? AppColors.backgroundLight.withOpacity(0.7)
                    : AppColors.backgroundLight,
                contentPadding: EdgeInsets.only(
                  left: widget.prefixIcon != null ? 16 : 16,
                  right: 16,
                  top: 16,
                  bottom: 16,
                ),
                prefixIcon: widget.prefixIcon != null 
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12, right: 0),
                        child: widget.prefixIcon,
                      )
                    : null,
                prefixIconConstraints: widget.prefixIcon != null
                    ? const BoxConstraints(
                        minWidth: 40,
                        minHeight: 24,
                      )
                    : null,
                // Error border - red with better visibility
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                // Normal borders
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: _isHovered ? AppColors.primaryBlue.withOpacity(0.3) : Colors.grey.shade300,
                    width: _isHovered ? 1.4 : 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primaryBlue,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade200,
                    width: 1.2,
                  ),
                ),
              ),
              dropdownColor: Colors.white,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
