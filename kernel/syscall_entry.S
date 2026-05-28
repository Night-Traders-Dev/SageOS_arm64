.global el0_sync_handler
el0_sync_handler:
    /* x8 = syscall number (Linux arm64 ABI)
     * x0-x5 = args
     * Return in x0
     */
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    /* Shift args to make room for syscall number in x0
     * syscall_dispatch(num, a1, a2, a3, a4, a5)
     */
    mov x5, x4
    mov x4, x3
    mov x3, x2
    mov x2, x1
    mov x1, x0
    mov x0, x8

    bl syscall_dispatch

    ldp x29, x30, [sp], #16
    eret
