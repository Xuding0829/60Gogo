#include <windows.h>  
#include <iostream>  

using namespace std;



//声明句柄  
HANDLE EmptyPlate;			//声明空盘子
HANDLE husbandThread;		//声明丈夫线程
HANDLE wifeThread;			//声明妻子线程
HANDLE bCoco;				//声明黑巧克力
HANDLE wCoco;				//声明白巧克力
HANDLE dogThread;			//声明小狗线程
HANDLE catThread;			//声明小猫线程

//线程函数声明
DWORD WINAPI husband(LPVOID IpParameter);		//丈夫线程函数声明
DWORD WINAPI wife(LPVOID IpParameter);			//妻子线程函数声明
DWORD WINAPI dog(LPVOID IpParameter);			//小狗线程函数声明
DWORD WINAPI cat(LPVOID IpParameter);			//小猫线程函数声明

//初始化黑、白巧克力
int wConoNum = 0;			//黑巧克力定为0
int bConoNum = 0;			//白巧克力定为0
int num = 0;

class PvTest 
{
	public:
		PvTest();
		~PvTest();
};

PvTest::PvTest()
{

}

//析构回收线程以及信号量
PvTest::~PvTest() 
{

}

int main()
{
	cout << " 请输入线程的次数(>=0): " << endl;
	cin >> num;
	while (num < 0)
	{
		cout << " 输入线程的次数不符合要求,请重新输入! " << endl;
		cout << " 请输入线程的次数(>=0): " << endl;
		cin >> num;
	}
		
	//创建信号量  
	EmptyPlate = CreateSemaphore(NULL, 1, 1, NULL);
	bCoco = CreateSemaphore(NULL, 0, 1, NULL);							//黑巧克力  
	wCoco = CreateSemaphore(NULL, 0, 1, NULL);							//白巧克力  

	//创建线程  
	// * 参数 1 内核安全属性 null 为默认
	// * 参数 2 线程可用的空间大小
	// * 参数 3 表示线程函数的地址
	// * 参数 4 传给线程的参数
	// * 参数 5 控制线程创建，为 0 表示创建后立即启动，CREATE_SUSPENDED 表示创建后先暂停
	// * 参数 6 表示 lpTHreadId 返回的线程 ID ， 传入 NULL 表示不需要 返回 ID 号
	husbandThread = CreateThread(NULL, 0, husband, NULL, 0, NULL);		//创建丈夫线程
	wifeThread = CreateThread(NULL, 0, wife, NULL, 0, NULL);			//创建妻子线程
	dogThread = CreateThread(NULL, 0, dog, NULL, 0, NULL);				//创建小狗线程
	catThread = CreateThread(NULL, 0, cat, NULL, 0, NULL);				//创建小猫线程

	//等线程的结束
	WaitForSingleObject(husbandThread, INFINITE);						//等待丈夫线程结束
	WaitForSingleObject(wifeThread, INFINITE);							//等待妻子线程结束
	WaitForSingleObject(dogThread, INFINITE);							//等待小狗线程结束
	WaitForSingleObject(catThread, INFINITE);							//等待小猫线程结束

	//关闭线程句柄  
	CloseHandle(husbandThread);											//关闭丈夫线程
	CloseHandle(wifeThread);											//关闭妻子线程
	CloseHandle(dogThread);												//关闭小狗线程
	CloseHandle(catThread);												//关闭小猫线程

	//关闭信号量句柄  
	CloseHandle(EmptyPlate);											//关闭空盘子句柄
	CloseHandle(wCoco);													//关闭黑巧克力句柄
	CloseHandle(bCoco);													//关闭白巧克力句柄

	return 0;
}


//丈夫线程
DWORD WINAPI husband(LPVOID IpParameter)
{
	for (int i = 0; i < num; ++i) 
	{
		WaitForSingleObject(EmptyPlate, INFINITE);				//P操作  
		// 开始临界区
		bConoNum++;
		cout << "\n丈夫往盘中放一个黑巧克力\n";
		cout << "盘子中情况：" << ((bConoNum == 1) ? "○" : "●") << endl;
		// 结束临界区  
		ReleaseSemaphore(bCoco, 1, NULL);						//V操作  
		Sleep(1000);
	}
	return 0;
}

//妻子线程
DWORD WINAPI wife(LPVOID IpParmeter)
{
	for (int i = 0; i < num; ++i) 
	{
		WaitForSingleObject(EmptyPlate, INFINITE);				//P操作  
		// 开始临界区  
		wConoNum++;
		cout << "\n妻子往盘中放一个白巧克\n";
		cout << "盘子中情况：" << (( bConoNum == 1) ? "○" : "●") << endl;
		// 结束临界区  
		ReleaseSemaphore(wCoco, 1, NULL);						//V操作  
		Sleep(500);
	}
	return 0;
}

//小狗线程
DWORD WINAPI dog(LPVOID IpParameter)
{
	for (int i = 0; i < num; ++i)
	{
		WaitForSingleObject(bCoco, INFINITE); //p操作  
		bConoNum--;
		cout << "小狗吃黑巧克!" << endl;
		ReleaseSemaphore(EmptyPlate, 1, NULL); //v操作  
	}
	return 0;
}

//小猫线程
DWORD WINAPI cat(LPVOID IpParameter)
{
	for (int i = 0; i < num; ++i)
	{
		WaitForSingleObject(wCoco, INFINITE); //p操作  
		wConoNum--;
		cout << "小猫吃白巧克力!" << endl;
		ReleaseSemaphore(EmptyPlate, 1, NULL); //v操作  
	}
	return 0;
}
