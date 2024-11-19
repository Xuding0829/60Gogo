Pc:
    A:wait（Bufempty）
    计算
    Buf <- 计算结果
    Bufempty <- false
    signal(Buffull)
    goto A

Pp:
    B:wait（Buffull)
    打印Buf中的数据
    清除Buf中的数据
    Buffull <- false
    signal(Bufempty)
    goto B