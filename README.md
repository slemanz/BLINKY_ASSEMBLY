# Fundamentos de Programação: Piscar LED em STM32F401 usando Assembly

Este repositório tem o objetivo de demonstrar como fazer um LED piscar no microcontrolador STM32F401 utilizando código Assembly. Este exemplo faz uso da porta GPIOA, pino 11, para controlar o LED. A intenção é fornecer uma base para o desenvolvimento de projetos específicos, requerendo configurações adicionais para se adaptar ao microcontrolador utilizado.

## Descrição

Neste projeto, utiliza-se Assembly para controlar o GPIOA, pino 11, do STM32F401 e fazer um LED piscar em intervalos regulares. Além do código em Assembly, também é fornecido um exemplo equivalente em C para comparação e entendimento das diferenças de implementação entre as duas linguagens.

## Requisitos

- STM32F401 MCU
- Ambiente de desenvolvimento compatível (como STM32CubeIDE)
- Conhecimento básico de assembly e C
- LED e resistor (para o circuito)

## Arquivos

- [Código em Assembly](Src/assembler.s)
- [Código equivalente em C](Src/equiv.c)

## Montagem do Circuito

Conecte um LED ao pino GPIOA, pino 11. Geralmente, é necessário um resistor limitador de corrente para evitar danos ao LED. A configuração básica seria:
- Anodo do LED -> Pino GPIOA, pino 11 do STM32F401
- Catodo do LED -> Resistor -> GND

## Compilação e Upload

### Assembly

1. Abra o arquivo de código Assembly no seu ambiente de desenvolvimento.
2. Realize as configurações necessárias para o código funcionar corretamente para o microcontrolador que você está usando.
3. Compile o código de acordo com as instruções do seu compilador de Assembly.
4. Faça o upload do binário gerado para o seu STM32F401.

### C

1. Abra o arquivo de código C no seu ambiente de desenvolvimento.
2. Realize as configurações necessárias para o código funcionar corretamente para o microcontrolador que você está usando.
3. Compile o código de acordo com as instruções do seu compilador C.
4. Faça o upload do binário gerado para o seu STM32F401.

---

Espero que este exemplo ajude você a entender melhor os fundamentos da programação em microcontroladores usando Assembly. Lembre-se de configurar adequadamente o código para seu microcontrolador específico antes de realizar a compilação. Se você tiver alguma dúvida ou sugestão, por favor, abra uma issue neste repositório.

Boa codificação!
