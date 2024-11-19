void father()  
{  
    while(true)  
    {  
        wait(empty);//等待盘空，申请临界资源  
        produce black_chocolate;  
        signal(black_chocolate);//black_chocolate++,告知小狗有黑巧克力了  
    }  
}  
  
void mother()  
{     
    while(true)  
    {  
        wait(empty);//等待盘空，申请临界资源  
        produce white_chocolate;  
        signal(white_chocolate);//white_chocolate++,告知小猫有白巧克力了  
    }  
}  
  
void dog()  
{     
    while(true)  
    {  
        wait(black_chocolate);//等待黑巧克力  
        consume black_chocolate  
        signal(empty);//empty++,告知爸爸盘子空了  
    }  
}

void cat()  
{     
    while(true)  
    {  
        wait(white_chocolate);//等待白巧克力  
        consume white_chocolate  
        signal(empty);//empty++,告知妈妈盘子空了  
    }  
}