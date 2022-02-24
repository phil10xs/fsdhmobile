String? validateRequired(String value, String name, {int? minLength}) {
  if (value == null || value.trim() == '') {
    return '$name is required';
  }

  if (minLength != null && value.length < minLength) {
    return '$name requires at least $minLength characters';
  }

  return null;
}
