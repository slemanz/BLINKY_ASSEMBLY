.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global ASM_main
.global ASM_loop

.equ RCC_BASE, 0x40023800
.equ GPIOA_BASE, 0x40020000
.equ RCC_AHB1ENR, (RCC_BASE + 0x30)
.equ GPIOA_MODER, (GPIOA_BASE + 0x00)
.equ GPIOA_ODR, (GPIOA_BASE + 0x14)
.equ GPIOA_BSRR, (GPIOA_BASE + 0x18)

ASM_main:
    /* Habilita o clock do led*/
    LDR r0, =RCC_AHB1ENR
    LDR r1, [r0]
    ORR r1, r1, #(1 << 0)  /* Set bit 0 (GPIOAEN) */
    STR r1, [r0]

    /* Set PA11 as output */
    LDR r0, =GPIOA_MODER
    LDR r1, [r0]
    ORR r1, r1, #(1 << 22)     /* Set bit 22 (PA11) */
    BIC r1, r1, #(1 << 23) /* Clear bit 23 (PA11) */
    STR r1, [r0]

ASM_loop:
    /* Toggle PA11 */
    LDR r0, =GPIOA_ODR
    LDR r1, [r0]
    EOR r1, r1, #(1 << 11)  /* Toggle PA11 */
    STR r1, [r0]

    /* delay loop */
    LDR r2, =0x3FFFFF  /* ajusta o tempo do delay */

delay_loop:
    SUBS r2, r2, #1
    BNE delay_loop

    B ASM_loop

    .end
