void delay (unsigned int t)
{
	unsigned int t2=0xffff;
	while(t--)
		for(;t2;t2--)
}
void init_uart()
{
	GPA0CON &= ~0xff;
	GPA0CON |=0x22;
	UCON0 = (1<<0)|(1<<2)|(1<<6)|(0<<10);//配置时钟源等
	ULCON0 = 0x03;//配置校验位灯
	UFCON0 = 0;//禁止FIFO
	UBRDIV0 = 34;// 66000000/115200/16-1=34.8
	UDIVSLOT0 = 0xDDDD;//0.8*16 整数查表
	return ;
}
void putc(unsigned char c)
{
	while ( !(UTRSTAT0 & (1<<2)));
		UTXH0 = c;
	return ;
}
char getc()
{
	while (!(UTRSTAT0 & (1<<0)));
		return URXH0;
}
void puts(char *str)
{
	char *p = str;
	while (*p)
		{
			putc(*p++);
		}
	return ;
}

int main()
{
	init_uart();
	char input;
	GPH0CON &= ~0xff;
	GPH0CON |= 0x11;
	GPH0DAT &= ~0xff;//0灭	
	while(1)
		{
			input = getc();
			if(input==0x0f)
				GPH0DAT = 0x01;
			else if(input==0xf0)
				GPH0DAT = 0x02;
			else
				GPH0CON = 0x00;
			
		}
	
	return 0;
}