Algoritmo "Escalas_Temperatura"
// Disciplina  : Programar em VisuAlg
// Descri��o   : Criar um programa que faz informa o valor da temperatura, em
//               graus Celsius, Fahrenheitheit e Kelvin
// Autor(a)    : Alexandre Freitas
// Data atual  : 18/07/2025
Var
   Celsius: inteiro
   Fahrenheit, Kelvin: real

Inicio
   MUDACOR("Amarelo", "Frente")
   LIMPATELA

   ESCREVAL("")
   ESCREVAL("================== VALORES ACIMA DE ZERO ======================")
   ESCREVAL("")
   
   ESCREVAL("Celsius Fahrenheit  Kelvin")

   PARA Celsius DE 0 AT� 100 FA�A
        Fahrenheit := (Celsius * 1.8)+32
        Kelvin  := Celsius + 273
        ESCREVAL(Celsius:3," = ",Fahrenheit:8:2," =    ",Kelvin:6:2)
   FIMPARA

   ESCREVAL("")
   ESCREVAL("================== VALORES ABAIXO DE ZERO ======================")
   ESCREVAL("")
   
   ESCREVAL("Celsius Fahrenheit  Kelvin")
   PARA Celsius DE -273 AT� 0 FA�A
        Fahrenheit := (Celsius * 1.8)+32
        Kelvin  := Celsius + 273
        ESCREVAL(Celsius:3," = ",Fahrenheit:8:2," =    ",Kelvin:6:2)
   FIMPARA
Fimalgoritmo