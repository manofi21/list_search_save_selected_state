// ignore_for_file: public_member_api_docs, sort_constructors_first
class Model {
  final String name;
  final bool isSelected;

  const Model({required this.name, this.isSelected = false});

  @override
  bool operator ==(covariant Model other) {
    if (identical(this, other)) return true;

    return other.name == name && other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;

  Model copyWith({
    String? name,
    bool? isSelected,
  }) {
    return Model(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
