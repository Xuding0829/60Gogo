#include <iostream>

using namespace std;

#define Max1 25 //访问序列数组大小
#define Max2 15 //内存块表数组大小

int saveCount[Max1][Max1];
int x_save, y_save;
int now_couont = 0;

struct pt
{
    int pno;   //页号
    int bno;   //块号
    int flag;  //状态位，为0时在不内存，为1时在内存
    int order; //优先序列
};

// 输入
void input(int *a, int n)
{
    for (int i = 0; i < n; i++)
    {
        cin >> *a;
        a++;
    }
}

// 输出序列
void output(int *a, int n)
{
    for (int i = 0; i < n; i++)
    {
        cout << *a << ' ';
        a++;
    }
    cout << '\n';
}

// 算法本体
void fifo(int *List_pages, int *bs, int n, int m) //n 序列个数  m 块个数
{
    pt ptlist[Max1];               //定义结构数组
    int k = 0, flag, cn = 0, i, j; //cn--统计缺页数
    for (j = 0; j < m; j++)        //赋初值 m 块个数
    {
        bs[j] = -100;
    }

    for (i = 0; i < n; i++) // 访问序列循环  n 序列个数
    {
        flag = 0;
        // 判断当前的值是否已经在 内存块中 ，如果在 flag 直接 = 1
        for (j = 0; j < m; j++)
        {
            if (List_pages[i] == bs[j])
            {
                flag = 1;
                break;
            }
        }

        if (flag == 1) //命中
        {
            if (i >= m)
            {
                ptlist[i].bno = j + 1;
                ptlist[i].flag = 1;            //命中，已存入，未缺页
                ptlist[i].pno = List_pages[i]; //ye
            }
            else
            {                       // 前 m 页直接载入就好了
                ptlist[i].flag = 0; //缺页，还未存入
                ptlist[i].pno = List_pages[i];
                bs[k] = List_pages[i]; //将当前页存入内存块
                ptlist[i].bno = k + 1;
                k = (k + 1) % m; //循环队列
                cn++;
            }
        }
        else
        {                       // 因为 目标值不在块中
            ptlist[i].flag = 0; //缺页，还未存入
            ptlist[i].pno = List_pages[i];

            bs[k] = List_pages[i]; //将当前页存入内存块
            ptlist[i].bno = k + 1;
            k = (k + 1) % m; //循环队列
            cn++;
        }

        cout << "第 " << i << "次进入 \n";
        for (int i = 0; i < m; i++)
        {
            saveCount[now_couont][i] = bs[i];
        }
        now_couont++;
    }
    cout << "计算结果：\n";
    cout << "---------------------------------------------------------------------\n";
    cout << "缺页个数：" << '\t' << cn << '\n';
    cout << "---------------------------------------------------------------------\n";
    cout << "访问次数：" << '\t' << n << '\n';
    cout << "---------------------------------------------------------------------\n";
    cout << "缺页率为：" << '\t' << (float)cn / n << '\n';
    cout << "---------------------------------------------------------------------\n";
    cout << "操作顺序：\n";
    cout << "---------------------------------------------------------------------\n";
    for (i = 0; i < m; i++)
    {
        cout << List_pages[i] << "\t!!缺页,还未存入!!\t"
             << "现已直接存入内存块!\t" << ptlist[i].bno << '\n';
        cout << "本次序列： >>>>>  ";
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
            cout << List_pages[i] << "\t!!缺页,还未存入!!\t"
                 << "操作：调出块号为：" << ptlist[i].bno << "--页号为" << ptlist[i].pno << "的进程" << '\n';
        }
        else
        {
            cout << List_pages[i] << "\t!!命中,已经存入!!\t"
                 << "操作：查询块号为：" << ptlist[i].bno << "--页号为" << ptlist[i].pno << "的进程" << '\n';
        }
        cout << "本次序列： >>>>>  ";
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

	cout << "输入内存块大小：\n";
	cin >> m;
	while( m <= 0)
	{
		cout << "输入正确的内存块大小!\n";
		cout << "输入内存块大小：\n";
		cin >> m;
	}

	cout << "输入序列个数：\n";
	cin >> n;

	while( n <= 0)
	{
		cout << "输入正确的序列个数!\n";
		cout << "输入序列个数：\n";
		cin >> n;
	}

	initGroup(n, m);

	cout << "请输入访问序列：\n";
	input(List_pages, n);
	cout << "访问序列：" << endl;
	output(List_pages, n);
	cout << "---------------------------------------------------------------------\n";
	cout << '\n';
	fifo(List_pages, bs, n, m);
}
