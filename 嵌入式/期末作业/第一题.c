void delay(unsigned int t)
{
	unsigned int t2 = 0xffff;
	while(t--)
	{
		for(;t2;t2–)
	}
}

int main()
{
	int i = 0;//控制移位
	int key_value = 0;
	GPA0CON &= ~0xffffffff;
	GPA0CON |= 0x11111111;//设置为输出
	GPA0DAT &= ~0xff;//灯灭，0灭
	GPH0CON &= ~0xff;//设置为输入
	while(1)
	{
		delay(500000);
		key_value = GPH0DAT & 0x3;
		if(key_value)
			{
				if(0x01==key_value)
					{
						i=0;
						while(1)//题目没有明确说明循坏几次，默认不退出
						{
							for(;i<=7;i++)
								{
									GPA0DAT = 1<<i;
                                    delay(20);
								}							
							if(i==8)
							{
								i=0;
							}
						}
					}
				else if(0x02==key_value)
					{
						GPA0DAT = 0x01;//第一次进来0先亮
						i=0;
						while(1)//题目没有明确说明循坏几次，默认不退出
						{
							for(;i<=7;i++)
								{
									GPA0DAT = 1<<(7-i);
                                    delay(20);
								}							
							if(i==8)
							{
								i=0;
							}
						}
					}
			}
	}
	return 0;
}
