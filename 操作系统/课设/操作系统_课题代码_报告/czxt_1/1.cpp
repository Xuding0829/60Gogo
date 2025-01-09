#include<iostream>
#include<stdlib.h>
using namespace std;
#define Free 0 //空闲状态
#define Busy 1 //已用状态
#define OK 1    //完成
#define ERROR 0 //出错
int MAX_length = 640;  //定义最大主存信息640KB
typedef int Status;
int flag;//标志位  0为空闲区     1为已分配的工作区

typedef struct FreAarea//定义一个空闲区说明表结构
{
	long size;   //分区大小
	long address; //分区地址
	int state;   //状态
}ElemType;


typedef struct DuLNode// 线性表的双向链表存储结构
{
	ElemType data;
	struct DuLNode *prior; //前趋指针
	struct DuLNode *next;  //后继指针
}


DuLNode, *DuLinkList;
DuLinkList block_first; //头结点
DuLinkList block_last;  //尾结点
Status Alloc(int);//内存分配
Status free(int); //内存回收
Status First_fit(int);//首次适应算法
Status Best_fit(int); //最佳适应算法
void show();//查看分配
Status Initblock();//开创空间表 


Status Initblock()//开创带头结点的内存空间链表
{
	block_first = (DuLinkList)malloc(sizeof(DuLNode));
	block_last = (DuLinkList)malloc(sizeof(DuLNode));
	// fist的前驱和后去
	block_first->prior = NULL;
	block_first->next = block_last;

	// last 的前驱和后续
	block_last->prior = block_first;
	block_last->next = NULL;

	block_last->data.address = 0;
	block_last->data.size = MAX_length;
	block_last->data.state = Free;
	
	return OK;
}


Status Alloc(int i)//分配主存
{
	int request = 0;
	cout << "操作编号 " << i ;
	cout << " 请输入需要分配的主存大小(单位:KB)：" << endl;
	cin >> request;
	if (request < 0 || request == 0)
	{
		cout << "分配大小不合适，请重试！" << endl;
		return ERROR;
	}

	if (Best_fit(request) == OK) cout << "分配成功！" << endl;
	else cout << "内存不足，分配失败！" << endl;
	return OK;
}


Status Best_fit(int request)//最佳适应算法
{
	int ch; //记录最小剩余空间
	DuLinkList temp = (DuLinkList)malloc(sizeof(DuLNode));
	temp->data.size = request;
	temp->data.state = Busy;
	DuLNode *p = block_first->next;
	DuLNode *q = NULL; //记录最佳插入位置 

	while (p) //初始化最小空间和最佳位置
	{
		if (p->data.state == Free && (p->data.size >= request))
		{
			if (q == NULL)
			{
				q = p;
				ch = p->data.size - request;
			}
			else if (q->data.size > p->data.size)
			{
				q = p;
				ch = p->data.size - request;
			}
		}
		p = p->next;
	}

	// q 为预期的目标位置
	if (q == NULL) return ERROR;//没有找到空闲块
	else if (q->data.size == request) // 大小刚刚好
	{
		q->data.state = Busy;
		return OK;
	}
	else /// 可分配内存块相对大
	{
		temp->prior = q->prior;
		temp->next = q;
		temp->data.address = q->data.address;
		q->prior->next = temp;
		q->prior = temp;
		q->data.address += request;
		q->data.size = ch;
		return OK;
	}
	return OK;
}

Status free(int flag)//主存回收
{
	DuLNode *p = block_first;
	for (int i = 0; i <= flag; i++)
		if (p != NULL)
			p = p->next;
		else
			return ERROR;

	p->data.state = Free;
	if (p->prior != block_first && p->prior->data.state == Free)//与前面的空闲块相连
	{
		p->prior->data.size += p->data.size;//空间扩充,合并为一个
		p->prior->next = p->next;//去掉原来被合并的p
		p->next->prior = p->prior;
		p = p->prior;
	}


	if (p->next != NULL &&  p->next != block_last && p->next->data.state == Free)//与后面的空闲块相连
	{
			p->data.size += p->next->data.size;//空间扩充,合并为一个
			p->next->next->prior = p;
			p->next = p->next->next;
	}

	if (p->next == block_last && p->next->data.state == Free)//与最后的空闲块相连
	{
		p->data.size += p->next->data.size;
		p->next = NULL;
	}

	return OK;
}

void showNow()//显示主存分配情况
{
	int flag = 0;
	cout << "\n              当前存分配情况:\n";
	cout << "----------------------------------------------\n\n";
	DuLNode *p = block_first->next;
	cout << "分区号\t起始地址\t分区大小\t状态\n\n";
	while (p)
	{
		cout << "  " << flag++ << "\t";
		cout << "  " << p->data.address << "\t\t";
		cout << " " << p->data.size << "KB\t\t";
		if (p->data.state == Free) cout << "空闲\n\n";
		else cout << "已分配\n\n";
		p = p->next;
	}
	cout << "----------------------------------------------\n\n";
}


void main()//主函数
{
	cout << "进入Best Fit\n";
	
	while (1)
	{
		cout << "\n请输内存块范围: ";
		cin >> MAX_length;
		cout << "\n";
		if (MAX_length <= 0)
		{
			cout << "内存块分配不能为0!" << endl;
		}
		else
		{
			break;
		}
	}

	Initblock(); //开创空间表
	int choice;  //操作选择标记

	while (1)
	{
		cout << "请输入您的操作：";
		cout << "\n1: 分配内存 2: 回收内存  3: 显示内存 0: 退出\n";

		cin >> choice;
		if (choice == 1)
		{
			showNow();
			int flag_count = 0;
			cout << "输入你要分配的内存块数: ";
			cin >> flag_count;
			for (int i = 1; i <= flag_count; i++)
			{
				Alloc(i); // 分配内存
			}
		}
		else if (choice == 2)  // 内存回收
		{
			showNow();
			int flag;
			cout << "请输入您要释放的分区号：" << endl;
			cin >> flag;
			free(flag);
		}
		else if (choice == 0) break; //退出
		else if (choice == 3) showNow();
		else //输入操作有误
		{
			cout << "输入有误，请重试！" << endl;
			continue;
		}
	}
}
