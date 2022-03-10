.orig x3000
    ;this stack lab computes the polish notation of a set of calls
    ;push_val(4) pushes the value 4 onto the stack [4]
    AND R0, R0, #0
    ADD R0, R0, #4
    LD R6, stack
    LD R5, SUB_PUSH_VAL_3400
    JSRR R5

    ;push_val(3) pushes the value 3 onto the stack [4,3]
    AND R0, R0, #0
    ADD R0, R0, #3
    LD R5, SUB_PUSH_VAL_3400
    JSRR R5

    ;push_val(2) pushes the value 2 onto the stack [4,3,2]
    AND R0, R0, #0
    ADD R0, R0, #2
    LD R5, SUB_PUSH_VAL_3400
    JSRR R5

    ;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
    LD R5, SUB_ADD_VAL_3800
    JSRR R5

    ;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
    LD R5, SUB_ADD_VAL_3800
    JSRR R5

    ;move the top value of the stack into r4
    ADD R6, R6, #-1
    LDR R4, R6, #0

    HALT
    
    SUB_PUSH_VAL_3400 .FILL x3400
    SUB_ADD_VAL_3800 .FILL x3800
    stack .FILL x4200
.end



.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
    ST R7, backup_r7_3400
    
    STR R0, R6, #0
    ADD R6, R6, #1

    LD R7, backup_r7_3400
    RET

    backup_r7_3400 .BLKW #1
.end



.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
    ST R1, backup_r1_3800
    ST R2, backup_r2_3800
    ST R3, backup_r3_3800
    ST R4, backup_r4_3800
    ST R7, backup_r7_3800
    
    AND R4, R4, #0
    
    ADD R6, R6, #-1
    LDR R1, R6, #0
    STR R4, R6, #0
    
    ADD R6, R6, #-1
    LDR R2, R6, #0
    
    AND R3, R3, #0
    ADD R3, R1, R2
    STR R3, R6, #0
    
    ADD R6, R6, #1

    LD R1, backup_r1_3800
    LD R2, backup_r2_3800
    LD R3, backup_r3_3800
    LD R4, backup_r4_3800
    LD R7, backup_r7_3800
    RET

    backup_r1_3800 .BLKW #1
    backup_r2_3800 .BLKW #1
    backup_r3_3800 .BLKW #1
    backup_r4_3800 .BLKW #1
    backup_r7_3800 .BLKW #1
.end



.orig x4200 ;;data you might need
    test .BLKW #100
.end


