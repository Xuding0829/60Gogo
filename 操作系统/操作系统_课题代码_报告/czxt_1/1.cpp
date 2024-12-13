#include<iostream>
#include<stdlib.h>
using namespace std;
#define Free 0 //����״̬
#define Busy 1 //����״̬
#define OK 1    //���
#define ERROR 0 //����
int MAX_length = 640;  //�������������Ϣ640KB
typedef int Status;
int flag;//��־λ  0Ϊ������     1Ϊ�ѷ���Ĺ�����

typedef struct FreAarea//����һ��������˵����ṹ
{
	long size;   //������С
	long address; //������ַ
	int state;   //״̬
}ElemType;


typedef struct DuLNode// ���Ա��˫������洢�ṹ
{
	ElemType data;
	struct DuLNode *prior; //ǰ��ָ��
	struct DuLNode *next;  //���ָ��
}


DuLNode, *DuLinkList;
DuLinkList block_first; //ͷ���
DuLinkList block_last;  //β���
Status Alloc(int);//�ڴ����
Status free(int); //�ڴ����
Status First_fit(int);//�״���Ӧ�㷨
Status Best_fit(int); //�����Ӧ�㷨
void show();//�鿴����
Status Initblock();//�����ռ�� 


Status Initblock()//������ͷ�����ڴ�ռ�����
{
	block_first = (DuLinkList)malloc(sizeof(DuLNode));
	block_last = (DuLinkList)malloc(sizeof(DuLNode));
	// fist��ǰ���ͺ�ȥ
	block_first->prior = NULL;
	block_first->next = block_last;

	// last ��ǰ���ͺ���
	block_last->prior = block_first;
	block_last->next = NULL;

	block_last->data.address = 0;
	block_last->data.size = MAX_length;
	block_last->data.state = Free;
	
	return OK;
}


Status Alloc(int i)//��������
{
	int request = 0;
	cout << "������� " << i ;
	cout << " ��������Ҫ����������С(��λ:KB)��" << endl;
	cin >> request;
	if (request < 0 || request == 0)
	{
		cout << "�����С�����ʣ������ԣ�" << endl;
		return ERROR;
	}

	if (Best_fit(request) == OK) cout << "����ɹ���" << endl;
	else cout << "�ڴ治�㣬����ʧ�ܣ�" << endl;
	return OK;
}


Status Best_fit(int request)//�����Ӧ�㷨
{
	int ch; //��¼��Сʣ��ռ�
	DuLinkList temp = (DuLinkList)malloc(sizeof(DuLNode));
	temp->data.size = request;
	temp->data.state = Busy;
	DuLNode *p = block_first->next;
	DuLNode *q = NULL; //��¼��Ѳ���λ�� 

	while (p) //��ʼ����С�ռ�����λ��
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

	// q ΪԤ�ڵ�Ŀ��λ��
	if (q == NULL) return ERROR;//û���ҵ����п�
	else if (q->data.size == request) // ��С�ոպ�
	{
		q->data.state = Busy;
		return OK;
	}
	else /// �ɷ����ڴ����Դ�
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

Status free(int flag)//�������
{
	DuLNode *p = block_first;
	for (int i = 0; i <= flag; i++)
		if (p != NULL)
			p = p->next;
		else
			return ERROR;

	p->data.state = Free;
	if (p->prior != block_first && p->prior->data.state == Free)//��ǰ��Ŀ��п�����
	{
		p->prior->data.size += p->data.size;//�ռ�����,�ϲ�Ϊһ��
		p->prior->next = p->next;//ȥ��ԭ�����ϲ���p
		p->next->prior = p->prior;
		p = p->prior;
	}


	if (p->next != NULL &&  p->next != block_last && p->next->data.state == Free)//�����Ŀ��п�����
	{
			p->data.size += p->next->data.size;//�ռ�����,�ϲ�Ϊһ��
			p->next->next->prior = p;
			p->next = p->next->next;
	}

	if (p->next == block_last && p->next->data.state == Free)//�����Ŀ��п�����
	{
		p->data.size += p->next->data.size;
		p->next = NULL;
	}

	return OK;
}

void showNow()//��ʾ����������
{
	int flag = 0;
	cout << "\n              ��ǰ��������:\n";
	cout << "----------------------------------------------\n\n";
	DuLNode *p = block_first->next;
	cout << "������\t��ʼ��ַ\t������С\t״̬\n\n";
	while (p)
	{
		cout << "  " << flag++ << "\t";
		cout << "  " << p->data.address << "\t\t";
		cout << " " << p->data.size << "KB\t\t";
		if (p->data.state == Free) cout << "����\n\n";
		else cout << "�ѷ���\n\n";
		p = p->next;
	}
	cout << "----------------------------------------------\n\n";
}


void main()//������
{
	cout << "����Best Fit\n";
	
	while (1)
	{
		cout << "\n�����ڴ�鷶Χ: ";
		cin >> MAX_length;
		cout << "\n";
		if (MAX_length <= 0)
		{
			cout << "�ڴ����䲻��Ϊ0!" << endl;
		}
		else
		{
			break;
		}
	}

	Initblock(); //�����ռ��
	int choice;  //����ѡ����

	while (1)
	{
		cout << "���������Ĳ�����";
		cout << "\n1: �����ڴ� 2: �����ڴ�  3: ��ʾ�ڴ� 0: �˳�\n";

		cin >> choice;
		if (choice == 1)
		{
			showNow();
			int flag_count = 0;
			cout << "������Ҫ������ڴ����: ";
			cin >> flag_count;
			for (int i = 1; i <= flag_count; i++)
			{
				Alloc(i); // �����ڴ�
			}
		}
		else if (choice == 2)  // �ڴ����
		{
			showNow();
			int flag;
			cout << "��������Ҫ�ͷŵķ����ţ�" << endl;
			cin >> flag;
			free(flag);
		}
		else if (choice == 0) break; //�˳�
		else if (choice == 3) showNow();
		else //�����������
		{
			cout << "�������������ԣ�" << endl;
			continue;
		}
	}
}
