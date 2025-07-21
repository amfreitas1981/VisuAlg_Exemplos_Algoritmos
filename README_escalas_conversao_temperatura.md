# Manual de Funcionamento
# Algoritmo: Escalas para conversao de tipos de temperatura


## 1. Objetivo do Programa
**Descrição:** Converter um valor de temperatura entre as escalas termométricas Celsius (C), Fahrenheit (F) e Kelvin (K), informando ao usuário os valores convertidos e exibindo mensagens especiais quando atingir o Zero Absoluto.

---

## 2. Entrada de Dados

### 2.1. Temperatura
- O usuário informa um valor numérico, positivo ou negativo, em formato decimal ou inteiro.
- O valor é lido como tipo real.
- Se o usuário informar:
	- `-0` (inexistente matematicamente)
	- Letras ou símbolos especiais (ex: `abc`, `@23`)
	O `VisuAlg` tentará interpretar como ZERO, e o código exibirá mensagens de orientação e interromperá a execução.

### 2.2. Escala Termométrica
- O usuário deve informar uma letra: `C, F ou K` (maiúscula ou minúscula).
- Caso contrário, será exibida a mensagem: "Escala inválida. Informar: 'C', 'F' ou 'K'."

---

## 3. Validação de Zero Absoluto
Antes de realizar a conversão, o programa verifica se o valor informado corresponde ao limite físico mínimo de temperatura, conhecido como Zero Absoluto:

| **Escala** | **Valor limite** |
|------------|------------------|
| Celsius    | -273.15 ºC 	    |
| Fahrenheit | -459.67 ºF 	    |
| Kelvin     | 0 K 	            |

**OBSERVAÇÃO:** Se a condição de `ZERO ABSOLUTO` for verdadeira, o programa solicita ao usuário que escolha um modo de exibição personalizado da mensagem especial, conforme abaixo.

---

4. Modos de Exibição da Mensagem “Zero Absoluto”
Usuário escolhe o estilo da mensagem ao atingir o Zero Absoluto:

| **Código** | **Estilo** | **Mensagem exibida**                                                                |
|------------|------------|-------------------------------------------------------------------------------------|
| 1          | Científico | ZERO ABSOLUTO! Temperatura mínima teórica — as partículas cessam movimento térmico. |
| 2          | Poético    | ZERO ABSOLUTO! O silêncio do cosmos, onde até o calor se cala.                      |
| 3          | Dramático  | ZERO ABSOLUTO! Nada pode estar mais frio — fronteira da física atingida!            |
| Outro      | Padrão     | ZERO ABSOLUTO! Exibindo padrão científico.                                          |
---

## 5. Conversões Realizadas
Conforme a escala informada, o programa realiza as conversões:

### 5.1. Quando informado Celsius:
- Exibe em `ºC`
- Converte para Fahrenheit: `(F = C \times \frac{9}{5} + 32)`
- Converte para Kelvin: `(K = C + 273.15)`

### 5.2. Quando informado Fahrenheit:
- Exibe em `ºF`
- Converte para Celsius: `(C = (F - 32) \times \frac{5}{9})`
- Converte para Kelvin: `(K = (F - 32) \times \frac{5}{9} + 273.15)`

### 5.3. Quando informado Kelvin:
- Exibe em `K`
- Converte para Celsius: `(C = K - 273.15)`
- Converte para Fahrenheit: `(F = (K - 273.15) \times \frac{9}{5} + 32)`

---

## 6. Mensagens de Orientação
Se o usuário informar valores incorretos (ex: -0, letras, símbolos), o programa exibe instruções educativas explicando:
- Por que `-0` é inválido.
- Como o `VisuAlg` interpreta dados inválidos como `0`.
- Recomenda o uso de números reais (inteiros ou decimais) com escala válida.

---

## 7. Encerramento
- Caso ocorra erro de entrada ou valor inválido, o programa exibe mensagens e usa interrompa para finalizar de forma segura.
- Se tudo estiver correto, a conversão é exibida com clareza.

---
