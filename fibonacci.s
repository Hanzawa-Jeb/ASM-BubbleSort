.text
    .globl  fibonacci

fibonacci:
    addi    sp, sp, -48
    sd      s0, 40(sp)
    addi    s0, sp, 48

    sd      a0, -40(s0)         # save n
    li      t0, 1
    sd      t0, -32(s0)         # const 1
    sd      ra, -24(s0)         # save ra

    # —— Base cases ——
    beq     a0, zero, ret1      # if n == 0 → return 1
    li      t0, 1
    beq     a0, t0, ret1        # if n == 1 → return 1

    # —— Recursive case —— 
    # fib(n-1)
    ld      a0, -40(s0)         # reload n
    addi    a0, a0, -1
    call    fibonacci
    mv      t0, a0              # t0 = fib(n-1)

    # fib(n-2)
    ld      a0, -40(s0)         # reload n
    addi    a0, a0, -2
    call    fibonacci
    mv      t1, a0              # t1 = fib(n-2)

    add     a0, t0, t1          # a0 = fib(n-1) + fib(n-2)

    # Restore and return
    ld      ra, -24(s0)
    ld      s0, 40(sp)
    addi    sp, sp, 48
    ret

ret1:
    # Base-case return = 1
    ld      a0, -32(s0)
    ld      ra, -24(s0)
    ld      s0, 40(sp)
    addi    sp, sp, 48
    ret
