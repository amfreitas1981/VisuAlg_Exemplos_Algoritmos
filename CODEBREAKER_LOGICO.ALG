algoritmo "Codebreaker_Simbolico"
var
   sequencia: vetor[1..20] de caractere
   tipoPadrao, i, n, diferenca, passos: inteiro
   proximo1, proximo2, elementoFixo: caractere
   ehNumerico, ehLetras, ehSimbolos: logico
   padraoAritmetico, padraoGeometrico, padraoAlternado: logico
   padraoMultiplicativo, padraoAlfabetico, padraoMisto: logico

funcao ehNumero(c: caractere): logico
var
   i: inteiro
inicio
   para i de 1 ate comprimento(c) faca
      se nao ((asc(copia(c, i, 1)) >= 48) e (asc(copia(c, i, 1)) <= 57) entao
         retorne falso
      fimse
   fimpara
   retorne verdadeiro
fimfuncao

funcao ehLetraMaiuscula(c: caractere): logico
inicio
   retorne (asc(c) >= 65) e (asc(c) <= 90)
fimfuncao

funcao ehLetraMinuscula(c: caractere): logico
inicio
   retorne (asc(c) >= 97) e (asc(c) <= 122)
fimfuncao

funcao proximaLetra(c: caractere; passos: inteiro): caractere
var
   codigo: inteiro
inicio
   codigo := asc(c)

   se ehLetraMaiuscula(c) entao
      codigo := codigo + passos
      se codigo > 90 entao
         codigo := codigo - 26
      fimse
      se codigo < 65 entao
         codigo := codigo + 26
      fimse
   senao se ehLetraMinuscula(c) entao
      codigo := codigo + passos
      se codigo > 122 entao
         codigo := codigo - 26
      fimse
      se codigo < 97 entao
         codigo := codigo + 26
      fimse
   fimse

   retorne chr(codigo)
fimfuncao

inicio
   escreva("Codebreaker Simbólico - Identifique padrões complexos")
   escreval("")
   escreva("Digite o tamanho da sequência (mín 3, máx 20): ")
   leia(n)

   // Coleta da sequência
   para i de 1 ate n faca
      escreva("Elemento ", i, ": ")
      leia(sequencia[i])
   fimpara

   // Verifica o tipo de sequência
   ehNumerico := verdadeiro
   ehLetras := verdadeiro
   ehSimbolos := verdadeiro

   para i de 1 ate n faca
      se nao ehNumero(sequencia[i]) entao
         ehNumerico := falso
      fimse

      se nao (ehLetraMaiuscula(sequencia[i]) ou (ehLetraMinuscula(sequencia[i])) entao
         ehLetras := falso
      fimse

      se (ehNumero(sequencia[i])) ou (ehLetraMaiuscula(sequencia[i])) ou (ehLetraMinuscula(sequencia[i])) entao
         ehSimbolos := falso
      fimse
   fimpara

   // ========== ANÁLISE DE PADRÕES ========== //

   // 1. Padrões Numéricos
   se ehNumerico entao
      // Progressão Aritmética
      diferenca := valor(sequencia[2]) - valor(sequencia[1])
      padraoAritmetico := verdadeiro
      para i de 2 ate n-1 faca
         se (valor(sequencia[i+1]) - valor(sequencia[i]) <> diferenca) entao
            padraoAritmetico := falso
         fimse
      fimpara

      se padraoAritmetico entao
         tipoPadrao := 1
         proximo1 := texto(valor(sequencia[n]) + diferenca)
         proximo2 := texto(valor(proximo1) + diferenca)
      senao
         // Progressão Geométrica
         se (valor(sequencia[1]) <> 0) entao
            diferenca := valor(sequencia[2]) div valor(sequencia[1])
            padraoGeometrico := verdadeiro
            para i de 2 ate n-1 faca
               se (valor(sequencia[i+1]) div valor(sequencia[i]) <> diferenca) entao
                  padraoGeometrico := falso
               fimse
            fimpara

            se padraoGeometrico entao
               tipoPadrao := 2
               proximo1 := texto(valor(sequencia[n]) * diferenca)
               proximo2 := texto(valor(proximo1) * diferenca)
            fimse
         fimse
      fimse

      // Padrão alternado com elemento fixo
      se (n >= 4) e (tipoPadrao = 0) entao
         padraoAlternado := verdadeiro
         elementoFixo := sequencia[2]
         para i de 2 ate n-1 passos 2 faca
            se (sequencia[i] <> elementoFixo) entao
               padraoAlternado := falso
            fimse
         fimpara

         se padraoAlternado entao
            tipoPadrao := 3
            se (n mod 2 = 0) entao
               proximo1 := texto(valor(sequencia[n-1]) + 1)
               proximo2 := elementoFixo
            senao
               proximo1 := elementoFixo
               proximo2 := texto(valor(sequencia[n]) + 1)
            fimse
         fimse
      fimse

      // Padrão multiplicativo crescente
      se (tipoPadrao = 0) e (n >= 3) entao
         padraoMultiplicativo := verdadeiro
         para i de 1 ate n-1 faca
            se (valor(sequencia[i+1]) <> valor(sequencia[i]) * (i+1)) entao
               padraoMultiplicativo := falso
            fimse
         fimpara

         se padraoMultiplicativo entao
            tipoPadrao := 4
            proximo1 := texto(valor(sequencia[n]) * (n+1))
            proximo2 := texto(valor(proximo1) * (n+2))
         fimse
      fimse
   fimse

   // 2. Padrões Alfabéticos
   se (ehLetras) e (tipoPadrao = 0) entao
      diferenca := asc(sequencia[2]) - asc(sequencia[1])
      padraoAlfabetico := verdadeiro
      para i de 2 ate n-1 faca
         se (asc(sequencia[i+1]) - asc(sequencia[i]) <> diferenca) entao
            padraoAlfabetico := falso
         fimse
      fimpara

      se padraoAlfabetico entao
         tipoPadrao := 5
         proximo1 := proximaLetra(sequencia[n], diferenca)
         proximo2 := proximaLetra(proximo1, diferenca)
      senao
         // Padrão alternado com letra fixa
         se (n >= 4) entao
            padraoAlternado := verdadeiro
            elementoFixo := sequencia[2]
            para i de 2 ate n-1 passos 2 faca
               se (sequencia[i] <> elementoFixo) entao
                  padraoAlternado := falso
               fimse
            fimpara

            se padraoAlternado entao
               tipoPadrao := 6
               se (n mod 2 = 0) entao
                  proximo1 := proximaLetra(sequencia[n-1], 1)
                  proximo2 := elementoFixo
               senao
                  proximo1 := elementoFixo
                  proximo2 := proximaLetra(sequencia[n], 1)
               fimse
            fimse
         fimse
      fimse
   fimse

   // 3. Padrões Mistos/Simbólicos
   se (tipoPadrao = 0) entao
      // Padrão alfanumérico alternado
      se (n >= 4) entao
         padraoMisto := verdadeiro
         para i de 1 ate n-1 faca
            se ((ehNumero(sequencia[i]) e ehNumero(sequencia[i+1])) ou
                (ehLetraMaiuscula(sequencia[i]) e ehLetraMaiuscula(sequencia[i+1])) ou
                (ehLetraMinuscula(sequencia[i]) e ehLetraMinuscula(sequencia[i+1]))) entao
               padraoMisto := falso
            fimse
         fimpara

         se padraoMisto entao
            tipoPadrao := 7
            se n mod 2 = 0 entao
               proximo1 := sequencia[n-1]
               proximo2 := sequencia[n]
            senao
               proximo1 := sequencia[n]
               proximo2 := sequencia[n-1]
            fimse
         fimse
      fimse

      // Padrão de símbolos repetitivos
      se (ehSimbolos) e (n >= 3) entao
         tipoPadrao := 8
         se (sequencia[1] = sequencia[3]) e (n >= 3) entao
            se n mod 2 = 0 entao
               proximo1 := sequencia[1]
               proximo2 := sequencia[2]
            senao
               proximo1 := sequencia[2]
               proximo2 := sequencia[1]
            fimse
         senao
            proximo1 := "?"
            proximo2 := "?"
         fimse
      fimse
   fimse

   // ========== RESULTADOS ========== //
   escreval("")
   escreval("=== RESULTADO ===")
   escreva("Sequência completa: ")

   para i de 1 ate n faca
      escreva(sequencia[i], "  ")
   fimpara

   se tipoPadrao <> 0 entao
      escreva(proximo1, "  ", proximo2)
   senao
      escreva("?  ?")
   fimse

   escreval("")
   escreval("")
   escreval("Tipo de padrão identificado: ")
   escolha tipoPadrao
      caso 1: escreval("Progressão Aritmética (+", diferenca, ")")
      caso 2: escreval("Progressão Geométrica (×", diferenca, ")")
      caso 3: escreval("Padrão alternado com elemento fixo: '", elementoFixo, "'")
      caso 4: escreval("Padrão multiplicativo crescente")
      caso 5: escreval("Sequência alfabética (passos: ", diferenca, ")")
      caso 6: escreval("Padrão alfabético alternado com '", elementoFixo, "' fixo")
      caso 7: escreval("Padrão misto alternado (números/letras/símbolos)")
      caso 8: escreval("Padrão simbólico repetitivo")
      outrocaso: escreval("Padrão não identificado")
   fimescolha
fimalgoritmo