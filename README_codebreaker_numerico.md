# Codebreaker_Numerico

## Descrição:
O **Codebreaker_Numerico** é um algoritmo desenvolvido para identificar e estender sequências numéricas com base em padrões matemáticos conhecidos. Ele analisa a entrada fornecida pelo usuário e tenta reconhecer um dos seguintes padrões:

---

## Tipos de Sequências Reconhecidas

### 1. Progressão Aritmética (PA)

**Descrição:**  
Cada termo é obtido somando uma constante (razão) ao termo anterior.

**Fórmula:**
```
aₙ = a₁ + (n - 1) × r
```

**Exemplo de Entrada:**
```
5, 8, 11, 14
```

**Saída Esperada:**
```
PA com razão 3 → sequência completa: 5, 8, 11, 14, 17, 20
```

---

### 2. Progressão Geométrica (PG)

**Descrição:**  
Cada termo é obtido multiplicando o anterior por uma constante (razão).

**Fórmula:**
```
aₙ = a₁ × rⁿ⁻¹
```

**Exemplo de Entrada:**
```
3, 6, 12, 24
```

**Saída Esperada:**
```
PG com razão 2 → sequência completa: 3, 6, 12, 24, 48, 96
```

---

### 3. Sequência Exponencial (Potência de Termos)

**Descrição:**  
Cada termo é o quadrado do anterior.

**Fórmula:**
```
aₙ₊₁ = aₙ²
```

**Exemplo de Entrada:**
```
3, 9, 81
```

**Saída Esperada:**
```
Sequência exponencial → sequência completa: 3, 9, 81, 6561, 43046721
```

---

### 4. Sequência Quadrática (n²)

**Descrição:**  
Cada termo é o quadrado da posição (índice).

**Fórmula:**
```
aₙ = n²
```

**Exemplo de Entrada:**
```
1, 4, 9, 16, 25
```

**Saída Esperada:**
```
Sequência quadrática → sequência completa: 1, 4, 9, 16, 25, 36, 49
```

---

### 5. Sequência Fatorial

**Descrição:**  
Cada termo é o fatorial da posição.

**Fórmula:**
```
aₙ = n!
```

**Exemplo de Entrada:**
```
1, 2, 6, 24, 120
```

**Saída Esperada:**
```
Sequência fatorial → sequência completa: 1, 2, 6, 24, 120, 720, 5040
```

---

### 6. Padrão Alternado

**Descrição:**  
A sequência alterna entre um valor fixo (intercalador) e uma progressão aritmética nos termos ímpares.

**Exemplo de Entrada:**
```
10, 0, 20, 0, 30
```

**Saída Esperada:**
```
Padrão alternado → sequência completa: 10, 0, 20, 0, 30, 0, 40
```

---

### 7. Multiplicação Acumulativa

**Descrição:**  
Cada termo é o produto acumulado dos anteriores.  
Este padrão é equivalente à sequência fatorial e será detectado como tal.

**Exemplo de Entrada:**
```
1, 2, 6, 24, 120
```

**Saída Esperada:**
```
Sequência fatorial → sequência completa: 1, 2, 6, 24, 120, 720, 5040
```

---

### 8. Padrão Não Reconhecido

**Descrição:**  
Quando a sequência não se encaixa em nenhum dos padrões anteriores.

**Exemplo de Entrada:**
```
1, 3, 7, 15, 31
```

**Saída Esperada:**
```
Padrão não reconhecido → sequência permanece inalterada
```

---

## Detalhes Técnicos

- O algoritmo analisa os padrões na seguinte ordem:  
  **PA → PG → Quadrática → Potência → Fatorial → Alternado**
- A verificação de PG é protegida contra divisão por zero.
- Sempre adiciona **dois novos termos** à sequência reconhecida.
- A saída é exibida com todos os termos, incluindo os novos calculados.

---

## Massas de Teste Utilizadas

| Tipo de Sequência         | Entrada                     | Saída Esperada                      |
|---------------------------|-----------------------------|-------------------------------------|
| Progressão Aritmética     | 5, 8, 11, 14                | 17, 20                              |
| Progressão Geométrica     | 3, 6, 12, 24                | 48, 96                              |
| Sequência Exponencial     | 3, 9, 81                    | 6561, 43046721                      |
| Sequência Quadrática      | 1, 4, 9, 16, 25             | 36, 49                              |
| Sequência Fatorial        | 1, 2, 6, 24, 120            | 720, 5040                           |
| Padrão Alternado          | 10, 0, 20, 0, 30            | 0, 40                               |
| Multiplicação Acumulativa | 1, 2, 6, 24, 120            | 720, 5040 (detectado como fatorial) |
| Padrão Não Reconhecido    | 1, 3, 7, 15, 31             | Nenhum padrão reconhecido           |

---

## Autor

Este projeto foi validado por Alexandre Freitas com testes extensivos para garantir precisão nos cálculos sequenciais.

---

