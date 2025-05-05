.text
.globl  fibonacci

fibonacci:
    mv      a4, a0      #move the input a0 to a4
    beq     a4,zero,.L1 #if input = 0, jump to .L1
    mv      a5, zero    #move zero to a5
    addi    a5, a5, 1   #self increment 0 to 1
    beq     a4, a5, .L1 #if input = 1, jump to .L1
    j       .L2

.L1:
    li      a0, 1       #a0 = 1
    ret                 #return the value

.L2:
    mv      a2, a0       #move a0 to a2
    addi    a2, a2, -1;  #self-subtract
    mv      a0, a2       #move back to a0
    call    fibonacci    #call the function
    mv      a3, a0       #get the return value of the function
    mv      a1, a2       #store the a2 to a1
    addi    a1, a1, -1   #store initial input-1 to a1
    mv      a0, a1       #move a1 to a0
    call    fibonacci    #call the function
    mv      a6, a0       #move the return value to a6
    add     a0, a3, a6   #get the return
    ret