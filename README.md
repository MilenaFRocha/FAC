# FAC
Repositório destinado ao estudo de Fundamentos e Arquitetura de Computadores

---

## Sumário

1. [Conceitos importantes](#1.Conceitosimportantes)
2. [Introdução](#introdução)
3. [RISC-V](#RISC-V)
4. [Instruções](#4.Instruções)
   1. [Operações lógicas](#Operações-lógicas)
   2. [Deslocamento de bit (shift bit )](#Deslocamentodebit (shift bit ))
   3. [Aritméticas](#Aritméticas)
   4. [Movimentação de dados](#Movimentaçãodedados)
   5. [Controle de fluxo condicional](#Controledefluxocondicional)
   6. [Controle de fluxo incondicional](#Controledefluxoincondicional)
6. [Prova 2](#Prova)
  



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
- Conversão de números de ponto flutuante para binário (se prepare para números grandes, ele não tem dó)
  - Exemplo: Converter o número 45.25 para binário (IEEE 754 de 32 bits)

   Parte inteira:
   
   45 em binário é 101101.
   Parte fracionária:
   
   0.25 em binário é 0.01 (0.25 * 2 = 0.5 -> 0, 0.5 * 2 = 1.0 -> 1).
   Juntar as partes:
   
   45.25 em binário é 101101.01.
   IEEE 754:
   
   Normalizamos: 1.0110101 x 2^5.
   Sinal: 0 (positivo).
   Expoente: 5 + 127 = 132 (em binário: 10000100).
   Mantissa: 01101010000000000000000.
   Resultado: 01000010001101010000000000000000.
- Saber diferenciar o que é CISC de RISC
  - CISC (Complex Instruction Set Computer):

   Conjunto de instruções mais complexo.
   Cada instrução pode executar várias operações.
   Exemplo: Intel x86.
   - RISC (Reduced Instruction Set Computer):
   
   Conjunto de instruções mais simples e reduzido.
   Cada instrução geralmente executa uma única operação.
   Exemplo: ARM, RISC-V
- Desenvolver em Assembly Risc V (Treine fazer loops como for, while, do while) (Treine também fazer if, else, else if)
- Analisar código em Assembly (Entender os comandos, como o código é executado, saber como funciona chamada de funções em assembly, e também comandos de operações lógicas como sll e srl)
- Saber resolver problemas em assembly (Treine problemas do beecrowd em assembly, principalmente com que mecha com operações matématicas como divisão, raiz quadrada, etc...)
- Estudar sobre os tipos de microarquiteturas e suas diferenças (uniciclo, multiciclo e pipeline)
- Estudar sobre partes da arquitetura de um computador, como barramentos e as suas características
- Estudar sobre cache, e como funciona
- Estudar sobre como funciona a memória, memória virtual, mapeamento de memória, paginação
  

