Algoritmo "Escalas_Conversao_Temperatura"
// Descri��o   : Convers�o entre escalas Celsius, Fahrenheit e Kelvin
Var
   temperatura: real
   escala, modo: caractere

   Procedimento ExibirZeroAbsoluto(modo: caractere)
   Inicio
      se modo = "1" entao
         escreval("ZERO ABSOLUTO! Temperatura m�nima te�rica � as part�culas cessam movimento t�rmico.")
      senao
         se modo = "2" entao
            escreval("ZERO ABSOLUTO! O sil�ncio do cosmos, onde at� o calor se cala.")
         senao
            se modo = "3" entao
               escreval("ZERO ABSOLUTO! Nada pode estar mais frio � fronteira da f�sica atingida!")
            senao
               escreval("ZERO ABSOLUTO! Exibindo padr�o cient�fico.")
            fimse
         fimse
      fimse
   FimProcedimento
Inicio
   MUDACOR("Amarelo", "Frente")
   LIMPATELA

   escreva("Informe a temperatura: ")
   leia(temperatura)
   
   // Valida n�mero zero com sinal negativo digitado
   // Valida outro tipo de dado que n�o seja num�rico
   se (temperatura = 0) entao
      // N�o podemos detectar o sinal em VisuAlg puro, ent�o avisamos ao usu�rio
      // A mesma regra, vale para letras e ou caracteres especiais
      // O VisuAlg n�o compila/executa convers�es de valores entre
      // tipos de vari�veis, retornando erro L�GICO na codifica��o
      escreval("Se informou '-0', esse valor n�o � v�lido para convers�o.")
      escreval("Caso tenha informado, incluindo letras ou caracteres ")
      escreval("especiais, automaticamente, o programa considera o valor ZERO ")
      escreval("para calcular a convers�o da escala entre tipos de temperaturas.")
      escreval("Use '0' ou outro valor num�rico positivo ou negativo ")
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
      escreval("Escolha o modo de exibi��o para mensagens especiais:")
      escreval("1 - Cient�fico")
      escreval("2 - Po�tico")
      escreval("3 - Dram�tico")
      escreval(" ")
      escreva("Digite o n�mero da op��o desejada: ")
      leia(modo)
   fimse

   se (escala = "c") ou (escala = "C") entao
      escreval(" ")
      escreval(" *** VALORES NAS ESCALAS CONVERTIDAS *** ")
      escreval(temperatura, " �C")
      escreval(((temperatura * 9/5) + 32), " �F")
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
         escreval(temperatura, " �F")
         escreval(((temperatura - 32) * 5/9), " �C")
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
            escreval((temperatura - 273.15), " �C")
            escreval((((temperatura - 273.15) * 9/5) + 32), " �F")
            escreval(" ")
            se temperatura = 0 entao
               escreval(" ")
               ExibirZeroAbsoluto(modo)
            fimse
         senao
            escreval("Escala inv�lida. Informar: 'C', 'F' ou 'K'.")
         fimse
      fimse
   fimse
Fimalgoritmo