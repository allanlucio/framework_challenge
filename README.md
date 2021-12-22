# framework_challenge

Este projeto foi desenvolvido com o objetivo de aplicar para a vaga de desenvolvedor Flutter na @Framework.

## Conceitos Aplicados

A Arquitetura base do projeto utiliza os seguintes conceitos

- Clean Archtecture
- Os testes realizados foram feitos utilizando a metodologia TDD
- lib **Modular** para Roteamento e injeção de dependências
- Gerência de Estado foi utilizada a lib **BLOC**
- A Lib **Freezed** foi utilizada para auxiliar na construção dos **BLOCs** e **Mockito**

## Instruções para execução

Como o projeto utiliza geração de código, é preciso executar o build runner para gerar o código necessário.

### 1 - Executando a geração de código: [Build Runner](https://pub.dev/packages/build_runner)

$ `flutter pub run build_runner watch --delete-conflicting-outputs`

### 2- Executanto o projeto flutter

Após ter feito a geração de código o projeto pode ser executado normalmente.

$ `flutter run`
