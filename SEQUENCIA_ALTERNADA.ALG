Algoritmo "Sequencia_Alternada"
// Disciplina  : Conhecimento
// Descrição   : Calcular sequência numérica alternada
// Autor(a)    : Alexandre Freitas
// Data atual  : 16/07/2025
Var
   i, tamanho, incremento, valor1, valor2, proximoValor: inteiro
   numeros: vetor[1..20] de inteiro
   intercalador: inteiro
Inicio
   escreva("Quantos números terá sua sequência? ")
   leia(tamanho)

   escreval("Digite os ", tamanho, " números da sequência:")
   para i de 1 ate tamanho faca
      leia(numeros[i])
   fimpara

   // Detectar intercalador (assumindo que aparece entre os principais)
   intercalador := numeros[2] // posição par

   // Identificar os dois últimos valores principais (em posições ímpares)
   valor2 := -1
   valor1 := -1

   // Ajustar índice para ignorar último intercalador se necessário
   i := tamanho
   se (numeros[i] = intercalador) entao
      i := i - 1
   fimse

   se (i mod 2 = 0) entao
      i := i - 1 // garantir que começa em posição ímpar
   fimse

   enquanto i >= 1 faca
      se valor2 = -1 entao
         valor2 := numeros[i]
      senao
         valor1 := numeros[i]
         interrompa
      fimse
      i := i - 2
   fimenquanto

   // Calcular incremento
   incremento := valor2 - valor1

   // Gerar o próximo valor principal
   proximoValor := valor2 + incremento

   // Imprimir sequência completa com os próximos valores
   escreval("Sequência completa com os próximos valores:")
   para i de 1 ate tamanho faca
      escreval(numeros[i])
   fimpara

   // Só imprime o intercalador se o último número da sequência não for ele
   se numeros[tamanho] <> intercalador entao
      escreval(intercalador)
   fimse

   escreval(proximoValor)
Fimalgoritmo