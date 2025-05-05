.text
    .globl bubble_sort
bubble_sort:
    # a0 is the pointer to the array
    # a1 is the length of the array
    # t0->i, index of the outer loop
    # t1->j, index of the inner loop
    # other txs are temporary registers

    li      t0, 0                #set the index of the outer-loop

outer_loop:
    addi    t4, a1, -1          # t4 = len - 1
    bge     t0, t4, done        # if greater than or equal, then skip to done

    li      t1, 0               # set j = 0
    sub     t4, a1, t0          # set t4 as len - i
    addi    t4, t4, -1          # subtract, set t4 as len - i - 1

inner_loop:
    bge     t1, t4, outer_inc   # if (j >= len-i-1) stop inner loop

    # calculate the address for arr[]j
    slli    t5, t1, 3           # left shift t5 = j * 8
    add     t5, a0, t5          # set t5 as the position for jth element
    ld      t2, 0(t5)           # set t2 = arr[j]
    ld      t3, 8(t5)           # set t3 = arr[j+1]

    # 
    ble     t2, t3, inner_inc   # if (arr[j] <= arr[j+1]) skip the exchange
    
    # exchange the elements
    sd      t3, 0(t5)           # arr[j] = arr[j+1]
    sd      t2, 8(t5)           # arr[j+1] = arr[j]
    
    j       inner_inc           # skip to the self increment

inner_inc:
    addi    t1, t1, 1           # self increment j
    j       inner_loop          # continue the inner loop

outer_inc:
    addi    t0, t0, 1           # self increment i
    j       outer_loop          # continue the outer loop

done:
    ret                         # return the result