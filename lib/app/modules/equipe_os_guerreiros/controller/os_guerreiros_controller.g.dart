// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'os_guerreiros_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OsGuerreirosController on _OsGuerreirosController, Store {
  Computed<int>? _$getPontuacaoComputed;

  @override
  int get getPontuacao =>
      (_$getPontuacaoComputed ??= Computed<int>(() => super.getPontuacao,
              name: '_OsGuerreirosController.getPontuacao'))
          .value;

  late final _$pontuacaoAtom =
      Atom(name: '_OsGuerreirosController.pontuacao', context: context);

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
      Atom(name: '_OsGuerreirosController.membros', context: context);

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
      Atom(name: '_OsGuerreirosController.loading', context: context);

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
      Atom(name: '_OsGuerreirosController.error', context: context);

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
      AsyncAction('_OsGuerreirosController._init', context: context);

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  late final _$listaOsGuerreirosAsyncAction = AsyncAction(
      '_OsGuerreirosController.listaOsGuerreiros',
      context: context);

  @override
  Future<void> listaOsGuerreiros() {
    return _$listaOsGuerreirosAsyncAction.run(() => super.listaOsGuerreiros());
  }

  late final _$editarMembroAsyncAction =
      AsyncAction('_OsGuerreirosController.editarMembro', context: context);

  @override
  Future<void> editarMembro({required int index, required String novoNome}) {
    return _$editarMembroAsyncAction
        .run(() => super.editarMembro(index: index, novoNome: novoNome));
  }

  late final _$inserirPontuacaoAsyncAction =
      AsyncAction('_OsGuerreirosController.inserirPontuacao', context: context);

  @override
  Future<void> inserirPontuacao({required int pontuacao}) {
    return _$inserirPontuacaoAsyncAction
        .run(() => super.inserirPontuacao(pontuacao: pontuacao));
  }

  late final _$consultaPontuacaoAsyncAction = AsyncAction(
      '_OsGuerreirosController.consultaPontuacao',
      context: context);

  @override
  Future<void> consultaPontuacao() {
    return _$consultaPontuacaoAsyncAction.run(() => super.consultaPontuacao());
  }

  late final _$removerMembroAsyncAction =
      AsyncAction('_OsGuerreirosController.removerMembro', context: context);

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
