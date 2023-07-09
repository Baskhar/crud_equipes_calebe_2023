// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rumo_ao_ceu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RumoAoCeuController on _RumoAoCeuController, Store {
  Computed<int>? _$getPontuacaoComputed;

  @override
  int get getPontuacao =>
      (_$getPontuacaoComputed ??= Computed<int>(() => super.getPontuacao,
              name: '_RumoAoCeuController.getPontuacao'))
          .value;

  late final _$pontuacaoAtom =
      Atom(name: '_RumoAoCeuController.pontuacao', context: context);

  @override
  int get pontuacao {
    _$pontuacaoAtom.reportRead();
    return super.pontuacao;
  }

  @override
  set pontuacao(int value) {
    _$pontuacaoAtom.reportWrite(value, super.pontuacao, () {
      super.pontuacao = value;
    });
  }

  late final _$membrosAtom =
      Atom(name: '_RumoAoCeuController.membros', context: context);

  @override
  ObservableList<String> get membros {
    _$membrosAtom.reportRead();
    return super.membros;
  }

  @override
  set membros(ObservableList<String> value) {
    _$membrosAtom.reportWrite(value, super.membros, () {
      super.membros = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_RumoAoCeuController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_RumoAoCeuController.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_initAsyncAction =
      AsyncAction('_RumoAoCeuController._init', context: context);

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  late final _$listaRumoAoCeuAsyncAction =
      AsyncAction('_RumoAoCeuController.listaRumoAoCeu', context: context);

  @override
  Future<void> listaRumoAoCeu() {
    return _$listaRumoAoCeuAsyncAction.run(() => super.listaRumoAoCeu());
  }

  late final _$editarMembroAsyncAction =
      AsyncAction('_RumoAoCeuController.editarMembro', context: context);

  @override
  Future<void> editarMembro({required int index, required String novoNome}) {
    return _$editarMembroAsyncAction
        .run(() => super.editarMembro(index: index, novoNome: novoNome));
  }

  late final _$inserirPontuacaoAsyncAction =
      AsyncAction('_RumoAoCeuController.inserirPontuacao', context: context);

  @override
  Future<void> inserirPontuacao({required int pontuacao}) {
    return _$inserirPontuacaoAsyncAction
        .run(() => super.inserirPontuacao(pontuacao: pontuacao));
  }

  late final _$consultaPontuacaoAsyncAction =
      AsyncAction('_RumoAoCeuController.consultaPontuacao', context: context);

  @override
  Future<void> consultaPontuacao() {
    return _$consultaPontuacaoAsyncAction.run(() => super.consultaPontuacao());
  }

  late final _$removerMembroAsyncAction =
      AsyncAction('_RumoAoCeuController.removerMembro', context: context);

  @override
  Future<void> removerMembro({required String nome}) {
    return _$removerMembroAsyncAction
        .run(() => super.removerMembro(nome: nome));
  }

  @override
  String toString() {
    return '''
pontuacao: ${pontuacao},
membros: ${membros},
loading: ${loading},
error: ${error},
getPontuacao: ${getPontuacao}
    ''';
  }
}
