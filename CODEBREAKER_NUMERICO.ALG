Algoritmo "Codebreaker_Numerico"
// Disciplina  : [Linguagem e L�gica de Programa��o]
// Descri��o   : C�lculos sequenciais num�ricos l�gicos
// Autor(a)    : Alexandre Freitas
// Data atual  : 16/07/2025
Var
   i, tam, valido, resto, fatorial: inteiro
   seq: vetor[1..20] de real
   razao, fixo, razaoPG, base: real
   valor1, valor2, incremento, proximoValor: real
Inicio
   Escreva("Quantos n�meros h� na sequ�ncia? ")
   Leia(tam)

   se (tam < 2) ent�o
      Escreval("M�nimo 2 elementos necess�rios.")
      Interrompa
   fimse

   Para i de 1 ate tam faca
      Escreva("Digite o ", i, "� n�mero: ")
      Leia(seq[i])
   FimPara

   // 1. Verifica Progress�o Aritm�tica
   valido <- 1
   razao <- seq[2] - seq[1]
   Para i de 2 ate tam-1 faca
      se (seq[i+1] - seq[i] <> razao) ent�o
         valido <- 0
      fimse
   FimPara

   se (valido = 1) ent�o
      seq[tam+1] <- seq[tam] + razao
      seq[tam+2] <- seq[tam+1] + razao
      Escreval("PA reconhecida. Raz�o: ", razao)
   senao
      // 2. Verifica Progress�o Geom�trica (com prote��o contra divis�o por zero)
      valido <- 1
      se (seq[1] = 0) ent�o
         valido <- 0
      senao
         razaoPG <- seq[2] / seq[1]
         Para i de 2 ate tam-1 faca
            se (seq[i] = 0) ent�o
               valido <- 0
            senao
               se (abs((seq[i+1]/seq[i]) - razaoPG) > 0.0001) ent�o
                  valido <- 0
               fimse
            fimse
         FimPara
      fimse

      se (valido = 1) ent�o
         seq[tam+1] <- seq[tam] * razaoPG
         seq[tam+2] <- seq[tam+1] * razaoPG
         Escreval("PG reconhecida. Raz�o: ", razaoPG)
      senao
         // 3. Verifica Sequ�ncia Quadr�tica (n�)
         valido <- 1
         Para i de 1 ate tam faca
            se (seq[i] <> i^2) ent�o
               valido <- 0
            fimse
         FimPara

         se (valido = 1) ent�o
            seq[tam+1] <- (tam+1)^2
            seq[tam+2] <- (tam+2)^2
            Escreval("Sequ�ncia quadr�tica (n�) reconhecida.")
         senao
            // 4. Verifica Sequ�ncia a^a (ex: 3, 9, 81)
            valido <- 1
            se (tam >= 2) ent�o
               base <- seq[1]
               Para i de 1 ate tam-1 faca
                  se (seq[i+1] <> seq[i]^2) ent�o
                     valido <- 0
                  fimse
               FimPara
            senao
               valido <- 0
            fimse

            se (valido = 1) ent�o
               seq[tam+1] <- seq[tam]^2
               seq[tam+2] <- seq[tam+1]^2
               Escreval("Sequ�ncia quadr�tica (a�) reconhecida.")
            senao
               // 5. Verifica Sequ�ncia Fatorial
               valido <- 1
               fatorial <- 1
               Para i de 1 ate tam faca
                  se (i > 1) ent�o
                     fatorial <- fatorial * i
                  fimse
                  se (seq[i] <> fatorial) ent�o
                     valido <- 0
                  fimse
               FimPara

               se (valido = 1) ent�o
                  fatorial <- fatorial * (tam+1)
                  seq[tam+1] <- fatorial
                  fatorial <- fatorial * (tam+2)
                  seq[tam+2] <- fatorial
                  Escreval("Sequ�ncia fatorial reconhecida.")
               senao
                  // 6. Verifica Padr�o Alternado
                  valido <- 1
                  fixo <- seq[2]

                  // Verifica se posi��es pares s�o iguais ao intercalador
                  Para i de 2 ate tam passo 2 faca
                     se (seq[i] <> fixo) ent�o
                        valido <- 0
                     fimse
                  FimPara

                  // Se v�lido, calcula incremento entre os �ltimos dois valores principais
                  se (valido = 1) ent�o
                     valor1 <- -1
                     valor2 <- -1
                     i <- tam
                     se (seq[i] = fixo) ent�o
                        i <- i - 1
                     fimse
                     se (i mod 2 = 0) ent�o
                        i <- i - 1
                     fimse

                     enquanto i >= 1 faca
                        se (valor2 = -1) ent�o
                           valor2 <- seq[i]
                        senao
                           valor1 <- seq[i]
                           interrompa
                        fimse
                        i <- i - 2
                     fimenquanto

                     incremento <- valor2 - valor1
                     proximoValor <- valor2 + incremento

                     resto <- tam MOD 2
                     se (resto = 0) ent�o
                        seq[tam+1] <- proximoValor
                        seq[tam+2] <- fixo
                     senao
                        seq[tam+1] <- fixo
                        seq[tam+2] <- proximoValor
                     fimse

                     Escreval("Padr�o alternado reconhecido. Intercalador: ", fixo, " | Incremento: ", incremento)
                  senao
                     Escreval("Padr�o n�o reconhecido.")
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimse

   Escreval("Sequ�ncia completa:")
   Para i de 1 ate tam+2 faca
      Escreva(seq[i]:0:0, " ")
   FimPara
Fimalgoritmo