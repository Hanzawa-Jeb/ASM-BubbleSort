.text
.globl  fibonacci

fibonacci:
    addi    sp, sp, -48             #malloc space 48 bytes
    sd      s0, 40(sp)              #store the initial value of s0 to the stack
    addi    s0, sp, 48              #store the bottom of the stack in the s0 reg
    sd      a0, -40(s0)             #store the parameter on the top of the stack
    sd      zero, 32(sp)            #store 0 to 32(sp)
    beq     -40(s0), 32(sp), ret1   #if == 0, jump to return 1
    addi    32(sp), 32(sp), 1       #construct 1
    beq     -40(s0), 0, ret1        #if == 1, jump to return 1
    call    fibonacci               #recursively call fibonacci
    addi    sp, sp, 48              #give back the memory space
    ret

ret1:
    ld      a0, 32(sp)              #load 1 to the space
    ret