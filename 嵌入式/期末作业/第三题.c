void time0_init()
{
    TCNTB0 = 10;
    TCMPB0 = 5;
    TCFG0 |= 65;
    TCFG1 = 0x00;
    TCON ｜= 0x02;
    TCON = 0x09;
}
void int_init()
{
    VIC0INTSELECT &= ~(1<<21);
    VIC0ADDRESS = 0x0;
    VIC0VECTADDR21 = (int)IRQ_handle;
    VIC0INTENABLE = 1<<21;
}
void init_timeirq()
{
    TINT_CSTAT ｜= 1；
}
void clear_timeirq()
{
    TINT_CSTAT |= 1<<5;
}
void int_addclear()
{
    VIC0ADDRESS = 0x0;
}
long get_irqstatus()
{
    return (VIC0IRQSTATUS);
}
void irq_handler()
{
    int status = ((get_irqstatus() & (1<<21))>>21) & 0x1;
    int_addclear();
    clear_timeirq();
    if(status)//有中断进来
    {
        if(GPD0DAT)
        {
            double zhankongbi = GPA0DAT/256;
            TCMPB0 = TCNTB0*zhankongbi;//改变占空比
            GPA0DAT &= ~0xff;//清空数据
            GPD0DAT &= ~0xff;//清空数据
        }
    }
}
void other_init()
{
    GPA0CON &= ~0xffffffff;//清零，全为输入;
    GPA0DAT = 0x00;//给所有数据清零;
    GPD0CON &= ~0xff;
    GPD0CON |= (1<<0);
    GPD0CON &= ~0xff;//清数据
}
int main()
{
    time0_init();
    init_timeirq();
    int_init();
    other_init();
    while(1)
    {
        
    }
    return 0;
}
