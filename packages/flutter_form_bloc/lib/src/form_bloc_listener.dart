import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/form_bloc.dart';

typedef FormBlocListenerCallback<
        State extends FormBlocState<SuccessResponse, ErrorResponse>,
        SuccessResponse,
        ErrorResponse>
    = void Function(BuildContext context, State state);

/// [BlocListener] that reacts to the state changes of the FormBloc.
class FormBlocListener<Bloc extends FormBloc<SuccessResponse, ErrorResponse>,
        SuccessResponse, ErrorResponse>
    extends BlocListener<Bloc, FormBlocState<SuccessResponse, ErrorResponse>> {
  /// [BlocListener] that reacts to the state changes of the FormBloc.
  /// {@macro bloclistener}
  FormBlocListener({
    super.key,
    this.formBloc,
    super.child,
    this.onLoading,
    this.onLoaded,
    this.onLoadFailed,
    this.onSubmitting,
    this.onSuccess,
    this.onFailure,
    this.onSubmissionCancelled,
    this.onSubmissionFailed,
    this.onDeleting,
    this.onDeleteFailed,
    this.onDeleteSuccessful,
  }) : super(
          bloc: formBloc as Bloc,
          listenWhen: (previousState, state) =>
              previousState.runtimeType != state.runtimeType,
          listener: (context, state) {
            if (state is FormBlocLoading<SuccessResponse, ErrorResponse> &&
                onLoading != null) {
              onLoading(context, state);
            } else if (state is FormBlocLoaded<SuccessResponse, ErrorResponse> &&
                onLoaded != null) {
              onLoaded(context, state);
            } else if (state
                    is FormBlocLoadFailed<SuccessResponse, ErrorResponse> &&
                onLoadFailed != null) {
              onLoadFailed(context, state);
            } else if (state
                    is FormBlocSubmitting<SuccessResponse, ErrorResponse> &&
                onSubmitting != null) {
              onSubmitting(context, state);
            } else if (state is FormBlocSuccess<SuccessResponse, ErrorResponse> &&
                onSuccess != null) {
              onSuccess(context, state);
            } else if (state
                    is FormBlocFailure<SuccessResponse, ErrorResponse> &&
                onFailure != null) {
              onFailure(context, state);
            } else if (state is FormBlocSubmissionCancelled<SuccessResponse,
                    ErrorResponse> &&
                onSubmissionCancelled != null) {
              onSubmissionCancelled(context, state);
            } else if (state is FormBlocSubmissionFailed<SuccessResponse,
                    ErrorResponse> &&
                onSubmissionFailed != null) {
              onSubmissionFailed(context, state);
            } else if (state
                    is FormBlocDeleting<SuccessResponse, ErrorResponse> &&
                onDeleting != null) {
              onDeleting(context, state);
            } else if (state
                    is FormBlocDeleteFailed<SuccessResponse, ErrorResponse> &&
                onDeleteFailed != null) {
              onDeleteFailed(context, state);
            } else if (state
                    is FormBlocDeleteSuccessful<SuccessResponse, ErrorResponse> &&
                onDeleteSuccessful != null) {
              onDeleteSuccessful(context, state);
            }
          },
        );

  /// {@macro form_state.FormBlocLoading}
  final FormBlocListenerCallback<
      FormBlocLoading<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onLoading;

  /// {@macro form_state.FormBlocLoaded}
  final FormBlocListenerCallback<FormBlocLoaded<SuccessResponse, ErrorResponse>,
      SuccessResponse, ErrorResponse>? onLoaded;

  /// {@macro form_state.FormBlocLoadFailed}
  final FormBlocListenerCallback<
      FormBlocLoadFailed<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onLoadFailed;

  /// {@macro form_state.FormBlocSubmitting}
  final FormBlocListenerCallback<
      FormBlocSubmitting<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onSubmitting;

  /// {@macro form_state.FormBlocSuccess}
  final FormBlocListenerCallback<
      FormBlocSuccess<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onSuccess;

  /// {@macro form_state.FormBlocFailure}
  final FormBlocListenerCallback<
      FormBlocFailure<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onFailure;

  /// {@macro form_state.FormBlocSubmissionCancelled}
  final FormBlocListenerCallback<
      FormBlocSubmissionCancelled<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onSubmissionCancelled;

  /// {@macro form_state.FormBlocSubmissionFailed}
  final FormBlocListenerCallback<
      FormBlocSubmissionFailed<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onSubmissionFailed;

  /// {@macro form_state.FormBlocSubmissionFailed}
  final FormBlocListenerCallback<
      FormBlocDeleting<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onDeleting;

  /// {@macro form_state.FormBlocSubmissionFailed}
  final FormBlocListenerCallback<
      FormBlocDeleteFailed<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onDeleteFailed;

  /// {@macro form_state.FormBlocSubmissionFailed}
  final FormBlocListenerCallback<
      FormBlocDeleteSuccessful<SuccessResponse, ErrorResponse>,
      SuccessResponse,
      ErrorResponse>? onDeleteSuccessful;

  /// If the [formBloc] parameter is omitted, [FormBlocListener]
  /// will automatically perform a lookup using
  /// [BlocProvider].of<[FormBloc]> and the current [BuildContext].
  final Bloc? formBloc;

  /// The [Widget] which will be rendered as a descendant of the [BlocListener].
  @override
  Widget? get child => super.child;
}
