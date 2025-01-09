#include <iostream>

using namespace std;

#define Max1 25 //�������������С
#define Max2 15 //�ڴ��������С

int saveCount[Max1][Max1];
int x_save, y_save;
int now_couont = 0;

struct pt
{
    int pno;   //ҳ��
    int bno;   //���
    int flag;  //״̬λ��Ϊ0ʱ�ڲ��ڴ棬Ϊ1ʱ���ڴ�
    int order; //��������
};

// ����
void input(int *a, int n)
{
    for (int i = 0; i < n; i++)
    {
        cin >> *a;
        a++;
    }
}

// �������
void output(int *a, int n)
{
    for (int i = 0; i < n; i++)
    {
        cout << *a << ' ';
        a++;
    }
    cout << '\n';
}

// �㷨����
void fifo(int *List_pages, int *bs, int n, int m) //n ���и���  m �����
{
    pt ptlist[Max1];               //����ṹ����
    int k = 0, flag, cn = 0, i, j; //cn--ͳ��ȱҳ��
    for (j = 0; j < m; j++)        //����ֵ m �����
    {
        bs[j] = -100;
    }

    for (i = 0; i < n; i++) // ��������ѭ��  n ���и���
    {
        flag = 0;
        // �жϵ�ǰ��ֵ�Ƿ��Ѿ��� �ڴ���� ������� flag ֱ�� = 1
        for (j = 0; j < m; j++)
        {
            if (List_pages[i] == bs[j])
            {
                flag = 1;
                break;
            }
        }

        if (flag == 1) //����
        {
            if (i >= m)
            {
                ptlist[i].bno = j + 1;
                ptlist[i].flag = 1;            //���У��Ѵ��룬δȱҳ
                ptlist[i].pno = List_pages[i]; //ye
            }
            else
            {                       // ǰ m ҳֱ������ͺ���
                ptlist[i].flag = 0; //ȱҳ����δ����
                ptlist[i].pno = List_pages[i];
                bs[k] = List_pages[i]; //����ǰҳ�����ڴ��
                ptlist[i].bno = k + 1;
                k = (k + 1) % m; //ѭ������
                cn++;
            }
        }
        else
        {                       // ��Ϊ Ŀ��ֵ���ڿ���
            ptlist[i].flag = 0; //ȱҳ����δ����
            ptlist[i].pno = List_pages[i];

            bs[k] = List_pages[i]; //����ǰҳ�����ڴ��
            ptlist[i].bno = k + 1;
            k = (k + 1) % m; //ѭ������
            cn++;
        }

        cout << "�� " << i << "�ν��� \n";
        for (int i = 0; i < m; i++)
        {
            saveCount[now_couont][i] = bs[i];
        }
        now_couont++;
    }
    cout << "��������\n";
    cout << "---------------------------------------------------------------------\n";
    cout << "ȱҳ������" << '\t' << cn << '\n';
    cout << "---------------------------------------------------------------------\n";
    cout << "���ʴ�����" << '\t' << n << '\n';
    cout << "---------------------------------------------------------------------\n";
    cout << "ȱҳ��Ϊ��" << '\t' << (float)cn / n << '\n';
    cout << "---------------------------------------------------------------------\n";
    cout << "����˳��\n";
    cout << "---------------------------------------------------------------------\n";
    for (i = 0; i < m; i++)
    {
        cout << List_pages[i] << "\t!!ȱҳ,��δ����!!\t"
             << "����ֱ�Ӵ����ڴ��!\t" << ptlist[i].bno << '\n';
        cout << "�������У� >>>>>  ";
        for (int j = 0; j < y_save; j++)
        {
            if (saveCount[i][j] != -1 && saveCount[i][j] != -100)
            {
                cout << saveCount[i][j] << ' ';
            }
        }
        cout << endl;
        cout << "---------------------------------------------------------------------\n";
    }
    for (i = m; i < n; i++)
    {
        if (ptlist[i].flag == 0)
        {
            cout << List_pages[i] << "\t!!ȱҳ,��δ����!!\t"
                 << "�������������Ϊ��" << ptlist[i].bno << "--ҳ��Ϊ" << ptlist[i].pno << "�Ľ���" << '\n';
        }
        else
        {
            cout << List_pages[i] << "\t!!����,�Ѿ�����!!\t"
                 << "��������ѯ���Ϊ��" << ptlist[i].bno << "--ҳ��Ϊ" << ptlist[i].pno << "�Ľ���" << '\n';
        }
        cout << "�������У� >>>>>  ";
        for (int j = 0; j < y_save; j++)
        {
            if (saveCount[i][j] != -1 && saveCount[i][j] != -100)
            {
                cout << saveCount[i][j] << ' ';
            }
        }
        cout << endl;
        cout << "---------------------------------------------------------------------\n";
    }
}

void initGroup(int x, int y)
{
    x_save = x;
    y_save = y;
    for (int i = 0; i < Max1; i++)
    {
        for (int j = 0; j < Max1; j++)
        {
            saveCount[i][j] = -1;
        }
    }
}

void main()
{
    int List_pages[Max1], bs[Max1];
    int n, m;

	cout << "�����ڴ���С��\n";
	cin >> m;
	while( m <= 0)
	{
		cout << "������ȷ���ڴ���С!\n";
		cout << "�����ڴ���С��\n";
		cin >> m;
	}

	cout << "�������и�����\n";
	cin >> n;

	while( n <= 0)
	{
		cout << "������ȷ�����и���!\n";
		cout << "�������и�����\n";
		cin >> n;
	}

	initGroup(n, m);

	cout << "������������У�\n";
	input(List_pages, n);
	cout << "�������У�" << endl;
	output(List_pages, n);
	cout << "---------------------------------------------------------------------\n";
	cout << '\n';
	fifo(List_pages, bs, n, m);
}
