Algoritmo "Sequencia_Alternada"
// Disciplina  : Conhecimento
// Descri��o   : Calcular sequ�ncia num�rica alternada
// Autor(a)    : Alexandre Freitas
// Data atual  : 16/07/2025
Var
   i, tamanho, incremento, valor1, valor2, proximoValor: inteiro
   numeros: vetor[1..20] de inteiro
   intercalador: inteiro
Inicio
   escreva("Quantos n�meros ter� sua sequ�ncia? ")
   leia(tamanho)

   escreval("Digite os ", tamanho, " n�meros da sequ�ncia:")
   para i de 1 ate tamanho faca
      leia(numeros[i])
   fimpara

   // Detectar intercalador (assumindo que aparece entre os principais)
   intercalador := numeros[2] // posi��o par

   // Identificar os dois �ltimos valores principais (em posi��es �mpares)
   valor2 := -1
   valor1 := -1

   // Ajustar �ndice para ignorar �ltimo intercalador se necess�rio
   i := tamanho
   se (numeros[i] = intercalador) entao
      i := i - 1
   fimse

   se (i mod 2 = 0) entao
      i := i - 1 // garantir que come�a em posi��o �mpar
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

   // Gerar o pr�ximo valor principal
   proximoValor := valor2 + incremento

   // Imprimir sequ�ncia completa com os pr�ximos valores
   escreval("Sequ�ncia completa com os pr�ximos valores:")
   para i de 1 ate tamanho faca
      escreval(numeros[i])
   fimpara

   // S� imprime o intercalador se o �ltimo n�mero da sequ�ncia n�o for ele
   se numeros[tamanho] <> intercalador entao
      escreval(intercalador)
   fimse

   escreval(proximoValor)
Fimalgoritmo