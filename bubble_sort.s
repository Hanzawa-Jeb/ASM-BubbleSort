.text
    .globl bubble_sort
bubble_sort:
    # a0 = 数组指针 arr
    # a1 = 数组长度 len
    # t0 = i（外层循环索引）
    # t1 = j（内层循环索引）
    # t2, t3 用于加载和比较元素
    # t4, t5 用于地址计算

    li      t0, 0                # i = 0

outer_loop:
    addi    t4, a1, -1          # t4 = len - 1
    bge     t0, t4, done        # if (i >= len-1) 结束排序

    li      t1, 0               # j = 0
    sub     t4, a1, t0          # t4 = len - i
    addi    t4, t4, -1          # t4 = len - i - 1

inner_loop:
    bge     t1, t4, outer_inc   # if (j >= len-i-1) 内层循环结束

    # 计算 arr[j] 的地址并加载元素
    slli    t5, t1, 3           # t5 = j * 8
    add     t5, a0, t5          # t5 = arr + j * 8
    ld      t2, 0(t5)           # t2 = arr[j]
    ld      t3, 8(t5)           # t3 = arr[j+1]

    # 比较并交换
    ble     t2, t3, inner_inc   # if (arr[j] <= arr[j+1]) 跳过交换
    
    # 交换元素
    sd      t3, 0(t5)           # arr[j] = arr[j+1]
    sd      t2, 8(t5)           # arr[j+1] = arr[j]

inner_inc:
    addi    t1, t1, 1           # j++
    j       inner_loop          # 继续内层循环

outer_inc:
    addi    t0, t0, 1           # i++
    j       outer_loop          # 继续外层循环

done:
    ret                         # 返回