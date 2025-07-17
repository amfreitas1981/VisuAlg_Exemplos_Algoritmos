Algoritmo "Codebreaker_Numerico"
Var
   i, tam, valido, resto, fatorial: inteiro
   seq: vetor[1..20] de real
   razao, fixo, razaoPG, base: real
   valor1, valor2, incremento, proximoValor: real
Inicio
   Escreva("Quantos números há na sequência? ")
   Leia(tam)

   se (tam < 2) então
      Escreval("Mínimo 2 elementos necessários.")
      Interrompa
   fimse

   Para i de 1 ate tam faca
      Escreva("Digite o ", i, "º número: ")
      Leia(seq[i])
   FimPara

   // 1. Verifica Progressão Aritmética
   valido <- 1
   razao <- seq[2] - seq[1]
   Para i de 2 ate tam-1 faca
      se (seq[i+1] - seq[i] <> razao) então
         valido <- 0
      fimse
   FimPara

   se (valido = 1) então
      seq[tam+1] <- seq[tam] + razao
      seq[tam+2] <- seq[tam+1] + razao
      Escreval("PA reconhecida. Razão: ", razao)
   senao
      // 2. Verifica Progressão Geométrica (com proteção contra divisão por zero)
      valido <- 1
      se (seq[1] = 0) então
         valido <- 0
      senao
         razaoPG <- seq[2] / seq[1]
         Para i de 2 ate tam-1 faca
            se (seq[i] = 0) então
               valido <- 0
            senao
               se (abs((seq[i+1]/seq[i]) - razaoPG) > 0.0001) então
                  valido <- 0
               fimse
            fimse
         FimPara
      fimse

      se (valido = 1) então
         seq[tam+1] <- seq[tam] * razaoPG
         seq[tam+2] <- seq[tam+1] * razaoPG
         Escreval("PG reconhecida. Razão: ", razaoPG)
      senao
         // 3. Verifica Sequência Quadrática (n²)
         valido <- 1
         Para i de 1 ate tam faca
            se (seq[i] <> i^2) então
               valido <- 0
            fimse
         FimPara

         se (valido = 1) então
            seq[tam+1] <- (tam+1)^2
            seq[tam+2] <- (tam+2)^2
            Escreval("Sequência quadrática (n²) reconhecida.")
         senao
            // 4. Verifica Sequência a^a (ex: 3, 9, 81)
            valido <- 1
            se (tam >= 2) então
               base <- seq[1]
               Para i de 1 ate tam-1 faca
                  se (seq[i+1] <> seq[i]^2) então
                     valido <- 0
                  fimse
               FimPara
            senao
               valido <- 0
            fimse

            se (valido = 1) então
               seq[tam+1] <- seq[tam]^2
               seq[tam+2] <- seq[tam+1]^2
               Escreval("Sequência quadrática (a²) reconhecida.")
            senao
               // 5. Verifica Sequência Fatorial
               valido <- 1
               fatorial <- 1
               Para i de 1 ate tam faca
                  se (i > 1) então
                     fatorial <- fatorial * i
                  fimse
                  se (seq[i] <> fatorial) então
                     valido <- 0
                  fimse
               FimPara

               se (valido = 1) então
                  fatorial <- fatorial * (tam+1)
                  seq[tam+1] <- fatorial
                  fatorial <- fatorial * (tam+2)
                  seq[tam+2] <- fatorial
                  Escreval("Sequência fatorial reconhecida.")
               senao
                  // 6. Verifica Padrão Alternado
                  valido <- 1
                  fixo <- seq[2]

                  // Verifica se posições pares são iguais ao intercalador
                  Para i de 2 ate tam passo 2 faca
                     se (seq[i] <> fixo) então
                        valido <- 0
                     fimse
                  FimPara

                  // Se válido, calcula incremento entre os últimos dois valores principais
                  se (valido = 1) então
                     valor1 <- -1
                     valor2 <- -1
                     i <- tam
                     se (seq[i] = fixo) então
                        i <- i - 1
                     fimse
                     se (i mod 2 = 0) então
                        i <- i - 1
                     fimse

                     enquanto i >= 1 faca
                        se (valor2 = -1) então
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
                     se (resto = 0) então
                        seq[tam+1] <- proximoValor
                        seq[tam+2] <- fixo
                     senao
                        seq[tam+1] <- fixo
                        seq[tam+2] <- proximoValor
                     fimse

                     Escreval("Padrão alternado reconhecido. Intercalador: ", fixo, " | Incremento: ", incremento)
                  senao
                     Escreval("Padrão não reconhecido.")
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimse

   Escreval("Sequência completa:")
   Para i de 1 ate tam+2 faca
      Escreva(seq[i]:0:0, " ")
   FimPara
Fimalgoritmo