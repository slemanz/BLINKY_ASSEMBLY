.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

/* definicoes funcoes */
.global ASM_main
.global ASM_loop

/* Definicoes de enderecos base e offsets */
.equ RCC_BASE, 0x40023800
.equ GPIOA_BASE, 0x40020000
.equ RCC_AHB1ENR, (RCC_BASE + 0x30)
.equ GPIOA_MODER, (GPIOA_BASE + 0x00)
.equ GPIOA_ODR, (GPIOA_BASE + 0x14)
.equ GPIOA_BSRR, (GPIOA_BASE + 0x18)

ASM_main:
    /* Habilita o clock do led*/
    LDR r0, =RCC_AHB1ENR    /* Carrega o endereco do registro AHB1ENR em r0. */
    LDR r1, [r0]            /* Carrega o valor do conteúdo do endereço em r0 (RCC_AHB1ENR) para r1. */
    ORR r1, r1, #(1 << 0)  /* Ativa o bit 0 (habilita o clock para GPIOA). */
    STR r1, [r0]            /* Armazena o valor modificado de volta no registro RCC_AHB1ENR. */

    /* Set PA11 as output */
    LDR r0, =GPIOA_MODER
    LDR r1, [r0]
    ORR r1, r1, #(1 << 22)     /* Configura PA11 como modo de saída (define bit 22) */
    BIC r1, r1, #(1 << 23)    /*  Garante que o bit 23 esteja limpo (modo de saída). */
    STR r1, [r0]

ASM_loop:
    /* Toggle PA11 */
    LDR r0, =GPIOA_ODR
    LDR r1, [r0]
    EOR r1, r1, #(1 << 11)  /* Alterna o estado do pino PA11 (toggle) */
    STR r1, [r0]

    /* delay loop */
    LDR r2, =0x3FFFFF  /* ajusta o tempo do delay */

/* define rotulo */
delay_loop:
    SUBS r2, r2, #1     /* decrementa 1 do valor de r2 */
    BNE delay_loop      /* Se r2 não for zero, repete o laço. */

    B ASM_loop          /* volte para o início do ASM_loop */

    .end                /* Finaliza o código */
