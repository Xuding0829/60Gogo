deposit(data):
    begin
        P(avail)
        P(mutex)
        送数据入缓冲区某单元
        V(full)
        V(mutex)
    end

remove(data):
    begin
        P(full)
        P(mutex)
        取出缓冲区某单元数据
        V(avail)
        V(mutex)
    end