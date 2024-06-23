# FAC
Repositório destinado ao estudo de Fundamentos e Arquitetura de Computadores

---

## Sumário


1. [Conceitos importantes](#1-conceitos-importantes)
2. [Introdução](#2-introdução)
3. [RISC-V](#3-risc-v)
4. [Instruções](#4-instruções)
   1. [Operações lógicas](#41-operações-lógicas)
   2. [Deslocamento de bit (shift bit)](#42-deslocamento-de-bit-shift-bit)
   3. [Aritméticas](#43-aritméticas)
   4. [Movimentação de dados](#44-movimentação-de-dados)
   5. [Controle de fluxo condicional](#45-controle-de-fluxo-condicional)
   6. [Controle de fluxo incondicional](#46-controle-de-fluxo-incondicional)
6. [Prova 2](#6-prova-2)
  



---
### 1.Conceitos importantes
- Imediatos: são "registradores" que fazem parte da instrução , mas não intrução pois são contantes, assim o acesso é mais rápido. Todas operações realizadas com imediatos são iguais, apenas acrescentar o i ao final da instrução.
-  Controle de fluxo : desvia o fluxo ,salta um comando. As condicionais são de if/else e as incodicionais de chmadas de funções. 

### 2. Introdução
  - Básico de Ted e Ped
  - RISC-V melhor que CISC

### 3.RISC-V
- Por que arquiteturas de 32 ou 64 bits? Porque a capacidade dos registradores é essa, assim para representar um número hexadecimal é necessário 4 bits. Então, cada endereço tem 4 bytes (32 bits), sendo que cada quadradinho tem 8 bits (4 para cada número):
  
| WORD ADDRESS | DATA | DATA | DATA | DATA | WORD NUMBER |
|--------------|------|------|------|------|-------------|
|    00000004  |  CD  |  91  |  D1  |  FA  |    WORD 4   |
|    00000003  |  B2  |  C2  |  D2  | 43   |    WORD 3   |
|    00000002  |  B3  |  C3  |  D3  | 56   |    WORD 2   |
|    00000001  |  B4  |  C4  |  D4  | 98   |    WORD 1   |
|    00000000  |  B5  |  C5  |  D5  | 45   |    WORD 0   |




  - Os menores valores são armazenados nos bits menos significativos como no exemplo: [load_store.asm](load_store.asm)

| Registrador |   Conteúdo   |
|-------------|--------------|
|     a0      |  00 00 00 00 |
|     a1      |  00 00 00 01 |
|     a2      |  00 00 00 02 |
|     a5      |  00 00 00 06 |

| Mémoria | Valor |
|---------|-------|
|    0    | 06    |
|    1    | 00    |
|    2    | 00    |
|    3    | 00    |

### 4.Instruções

**1. Operações lógicas**
   - and a0, a2 ,s2 -> a0 = a2 & a3
   - or a1 ,a3 ,s2  -> a1 = a3 | s2
   - xor a2 ,a2 ,a1 -> a2 = a2 x a1

**2.Deslocamento de bit (shift bit )**
  - sll = shift left logical -> está indo para esquerda então os bits são adicionados na direita
    - sll a0, a2, a1 -> a0 = a2 << a1
  - srl = shift right logical -> está indo para direita então os bits são adicionados na esquerda
    - srl a0, a2, a1 -> a0 = a2 >> a1
  - sra = shift rigt aritimetical -> está indo para direta e repete o bit mais significativo
     - sra a2, a2 ,a1 -> a0 = a2 >>* a1
    
**3. Aritméticas**
  - obs: não existe subi ,pois apenas muda o sinal da constante
     - add a0, a2, t2 -> adição
     - sub a1, t3, a0 -> subtração
     - mul a2, t1, a0 -> multiplicação
     - div a3, t2, a1 -> divisão
     - rem a3, t3, a2 -> resto
     
**4. Movimentação de dados**
  - lw (load word)-> ler palavra da memória (4 bytes)
       - lw a0, imm(a2) -> a0 = mem[a2 + imm]
  - lh (load half-word) -> ler meia palavra (2 bytes)
    - lw a0, imm(a2) -> a0 = mem[a2 + imm]
  - lhu (load half-word unsigned)
  - lb (load byte ) -> le apenas 1 byte
  - lbu (load byte unsigned ) -> le 1 byte sem sinal
  - sw (store word ) -> escreve do registrador na memória (4 bytes)
    - sw a0, imm(a2) -> mem[a2 + imm] = a0
  -sh (store half-word ) -> apenas os 2 bytes de a0
  - sb (store byte ) -> apenas 1 byte
  

**5. Controle de fluxo condicional**
- beq (branch equal ) -> compara dois conteúdos de registradores e se forem iguais pega o enderenço(label) da próxima instrução
    ```assembly
  beq a0, a2, next_item
      add a, a0, a1
  next_item:
      sub a0, s1, s2
- bne (branch no equal) -> compara dois conteúdos de registradores e se não forem iguais pega o enderenço(label) da próxima instrução
- blt (branch less than) -> compara se o primeiro registrador é maior que o sengundo
- bge (branch great equal ) -> compara se o primeiro é maior ou igual ao segundo
- bltu (branch less than unsigned ) -> igual ao blt porém considerando positivos
- bgeu (branch great equaunsigned ) -> igual ao bge porém considerando positivos

**6. Controle de fluxo incondicional**

- jal (jump and link) -> já chama a função, salto direto
  ```assembly
     jal ra, foo
     add a0, a0, a1
  foo:
     sub a0, s1, s2
  ```
     - jal a0, label -> no registrador a0 é salvo o endereço da próxima função e depois vai para a label da chamada
-jalr (jump and link rest ) -> chama a função , salto indireto ,pois obtem o endereço a partir do registrador
   - jalr a0, a1, 0-> no registrador a0 salva o endereço da próxima instrução e depois faz o jump , le o registrador a1 e pula para o endereço somado ao imediato
 
**7. Chamadas do sistema operacional**
- ecall -> invoca o sistema operacional

**8. Comparação de valores**
- slt

### 5.Prova 2
# Checklist de Estudo para Prova de Fundamentos e Arquiteturas

## Conversão de Números de Ponto Flutuante para Binário
- [x] Entender a conversão de números inteiros para binário
- [x] Entender a conversão de números fracionários para binário
- [x] Compreender a normalização de números binários
- [x] Aprender a formatar números em ponto flutuante segundo o padrão IEEE 754
- [x] Praticar com números grandes e pequenos

## Diferenciação entre CISC e RISC
- [x] Estudar as características do CISC
- [x] Estudar as características do RISC
- [x] Comparar vantagens e desvantagens de CISC e RISC
- [x] Examinar exemplos de arquiteturas CISC e RISC

## Desenvolvimento em Assembly RISC-V
- [x] Praticar escrever loops `for` em Assembly RISC-V
- [x] Praticar escrever loops `while` em Assembly RISC-V
- [x] Praticar escrever loops `do while` em Assembly RISC-V
- [x] Praticar escrever estruturas condicionais `if`, `else if`, `else` em Assembly RISC-V

## Análise de Código em Assembly
- [x] Entender os comandos básicos de Assembly RISC-V
- [x] Estudar como o código Assembly é executado
- [x] Aprender sobre a chamada de funções em Assembly
- [x] Entender operações lógicas como `sll` (shift left logical) e `srl` (shift right logical)
- [x] Praticar a análise de códigos de exemplo

## Resolução de Problemas em Assembly
- [x] Resolver problemas de divisão em Assembly
- [x] Resolver problemas de raiz quadrada em Assembly
- [x] Resolver problemas matemáticos no beecrowd usando Assembly
- [x] Praticar resolução de problemas diversos que envolvam operações matemáticas

## Tipos de Microarquiteturas
- [x] Estudar a microarquitetura de ciclo único
- [x] Estudar a microarquitetura de múltiplos ciclos
- [x] Estudar a microarquitetura pipeline
- [x] Comparar as diferenças entre ciclo único, múltiplos ciclos e pipeline

## Partes da Arquitetura de um Computador
- [ ] Estudar sobre os barramentos de dados, endereços e controle
- [ ] Entender as características dos diferentes tipos de barramentos
- [ ] Aprender como os barramentos interagem com outros componentes do computador

## Cache
- [ ] Estudar o funcionamento da cache de dados
- [ ] Estudar o funcionamento da cache de instruções
- [ ] Compreender os princípios de localidade temporal e espacial
- [ ] Aprender sobre políticas de substituição de cache

## Memória
- [x] Estudar o funcionamento da memória principal
- [x] Entender o conceito de memória virtual
- [x] Estudar o mapeamento de memória
- [x] Compreender o processo de paginação
- [ ] Aprender sobre tabelas de páginas e TLB (Translation Lookaside Buffer)


