Algoritmo "Escalas_Conversao_Temperatura"
// Descrição   : Conversão entre escalas Celsius, Fahrenheit e Kelvin
Var
   temperatura: real
   escala, modo: caractere

   Procedimento ExibirZeroAbsoluto(modo: caractere)
   Inicio
      se modo = "1" entao
         escreval("ZERO ABSOLUTO! Temperatura mínima teórica — as partículas cessam movimento térmico.")
      senao
         se modo = "2" entao
            escreval("ZERO ABSOLUTO! O silêncio do cosmos, onde até o calor se cala.")
         senao
            se modo = "3" entao
               escreval("ZERO ABSOLUTO! Nada pode estar mais frio — fronteira da física atingida!")
            senao
               escreval("ZERO ABSOLUTO! Exibindo padrão científico.")
            fimse
         fimse
      fimse
   FimProcedimento
Inicio
   MUDACOR("Amarelo", "Frente")
   LIMPATELA

   escreva("Informe a temperatura: ")
   leia(temperatura)
   
   // Valida número zero com sinal negativo digitado
   // Valida outro tipo de dado que não seja numérico
   se (temperatura = 0) entao
      // Não podemos detectar o sinal em VisuAlg puro, então avisamos ao usuário
      // A mesma regra, vale para letras e ou caracteres especiais
      // O VisuAlg não compila/executa conversões de valores entre
      // tipos de variáveis, retornando erro LÓGICO na codificação
      escreval("Se informou '-0', esse valor não é válido para conversão.")
      escreval("Caso tenha informado, incluindo letras ou caracteres ")
      escreval("especiais, automaticamente, o programa considera o valor ZERO ")
      escreval("para calcular a conversão da escala entre tipos de temperaturas.")
      escreval("Use '0' ou outro valor numérico positivo ou negativo ")
      escreval("(inteiro ou decimal), acrescido da escala de temperaturas,")
      escreval("conforme a legenda.")
      escreval(" ")
      escreval(" ")
      interrompa
   fimse

   escreva("Informe a escala (C - Celsius, F - Fahrenheit, K - Kelvin): ")
   leia(escala)
   
   // Caso informem valores considerados para atingir o ZERO ABSOLUTO
   se ((temperatura = -273.15) e (escala = "c") ou (escala = "C")) ou ((temperatura = -459.67) e (escala = "f") ou (escala = "F")) ou ((temperatura = 0) e (escala = "k") ou (escala = "K")) entao
      escreval(" ")
      escreval(" ")
      escreval("Escolha o modo de exibição para mensagens especiais:")
      escreval("1 - Científico")
      escreval("2 - Poético")
      escreval("3 - Dramático")
      escreval(" ")
      escreva("Digite o número da opção desejada: ")
      leia(modo)
   fimse

   se (escala = "c") ou (escala = "C") entao
      escreval(" ")
      escreval(" *** VALORES NAS ESCALAS CONVERTIDAS *** ")
      escreval(temperatura, " ºC")
      escreval(((temperatura * 9/5) + 32), " ºF")
      se temperatura = -273.15 entao
         escreval(" ")
         ExibirZeroAbsoluto(modo)
      senao
         escreval((temperatura + 273.15), " K")
      fimse

   senao
      se (escala = "f") ou (escala = "F") entao
         escreval(" ")
         escreval(" *** VALORES NAS ESCALAS CONVERTIDAS *** ")
         escreval(temperatura, " ºF")
         escreval(((temperatura - 32) * 5/9), " ºC")
         escreval(" ")
         se temperatura = -459.67 entao
            escreval(" ")
            ExibirZeroAbsoluto(modo)
         senao
            escreval((((temperatura - 32) * 5/9) + 273.15), " K")
         fimse

      senao
         se (escala = "k") ou (escala = "K") entao
            escreval(" ")
            escreval(" *** VALORES NAS ESCALAS CONVERTIDAS *** ")
            escreval((temperatura - 273.15), " ºC")
            escreval((((temperatura - 273.15) * 9/5) + 32), " ºF")
            escreval(" ")
            se temperatura = 0 entao
               escreval(" ")
               ExibirZeroAbsoluto(modo)
            fimse
         senao
            escreval("Escala inválida. Informar: 'C', 'F' ou 'K'.")
         fimse
      fimse
   fimse
Fimalgoritmo