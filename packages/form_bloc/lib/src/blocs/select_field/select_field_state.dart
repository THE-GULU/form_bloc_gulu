part of '../field/field_bloc.dart';

class SelectFieldBlocState<Value, ExtraData>
    extends FieldBlocState<Value?, Value, ExtraData?> {
  final List<Value> items;

  SelectFieldBlocState({
    required super.isValueChanged,
    required super.initialValue,
    required super.updatedValue,
    required super.value,
    required super.error,
    required super.isDirty,
    required super.suggestions,
    required super.isValidated,
    required super.isValidating,
    super.formBloc,
    required super.name,
    this.items = const [],
    super.toJson,
    super.extraData,
  });

  @override
  SelectFieldBlocState<Value, ExtraData> copyWith({
    bool? isValueChanged,
    Param<Value?>? initialValue,
    Param<Value?>? updatedValue,
    Param<Value?>? value,
    Param<Object?>? error,
    bool? isDirty,
    Param<Suggestions<Value>?>? suggestions,
    bool? isValidated,
    bool? isValidating,
    Param<FormBloc?>? formBloc,
    List<Value>? items,
    Param<ExtraData?>? extraData,
  }) {
    return SelectFieldBlocState(
      isValueChanged: isValueChanged ?? this.isValueChanged,
      initialValue: initialValue.or(this.initialValue),
      updatedValue: updatedValue.or(this.updatedValue),
      value: value == null ? this.value : value.value,
      error: error == null ? this.error : error.value,
      isDirty: isDirty ?? this.isDirty,
      suggestions: suggestions == null ? this.suggestions : suggestions.value,
      isValidated: isValidated ?? this.isValidated,
      isValidating: isValidating ?? this.isValidating,
      formBloc: formBloc == null ? this.formBloc : formBloc.value,
      name: name,
      items: items ?? this.items,
      toJson: _toJson,
      extraData: extraData == null ? this.extraData : extraData.value,
    );
  }

  @override
  String toString([String extra = '']) =>
      super.toString(',\n  items: $items$extra');

  @override
  List<Object?> get props => [super.props, items];
}
