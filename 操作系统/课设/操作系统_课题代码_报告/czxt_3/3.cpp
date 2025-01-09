#include <windows.h>  
#include <iostream>  

using namespace std;



//�������  
HANDLE EmptyPlate;			//����������
HANDLE husbandThread;		//�����ɷ��߳�
HANDLE wifeThread;			//���������߳�
HANDLE bCoco;				//�������ɿ���
HANDLE wCoco;				//�������ɿ���
HANDLE dogThread;			//����С���߳�
HANDLE catThread;			//����Сè�߳�

//�̺߳�������
DWORD WINAPI husband(LPVOID IpParameter);		//�ɷ��̺߳�������
DWORD WINAPI wife(LPVOID IpParameter);			//�����̺߳�������
DWORD WINAPI dog(LPVOID IpParameter);			//С���̺߳�������
DWORD WINAPI cat(LPVOID IpParameter);			//Сè�̺߳�������

//��ʼ���ڡ����ɿ���
int wConoNum = 0;			//���ɿ�����Ϊ0
int bConoNum = 0;			//���ɿ�����Ϊ0
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

//���������߳��Լ��ź���
PvTest::~PvTest() 
{

}

int main()
{
	cout << " �������̵߳Ĵ���(>=0): " << endl;
	cin >> num;
	while (num < 0)
	{
		cout << " �����̵߳Ĵ���������Ҫ��,����������! " << endl;
		cout << " �������̵߳Ĵ���(>=0): " << endl;
		cin >> num;
	}
		
	//�����ź���  
	EmptyPlate = CreateSemaphore(NULL, 1, 1, NULL);
	bCoco = CreateSemaphore(NULL, 0, 1, NULL);							//���ɿ���  
	wCoco = CreateSemaphore(NULL, 0, 1, NULL);							//���ɿ���  

	//�����߳�  
	// * ���� 1 �ں˰�ȫ���� null ΪĬ��
	// * ���� 2 �߳̿��õĿռ��С
	// * ���� 3 ��ʾ�̺߳����ĵ�ַ
	// * ���� 4 �����̵߳Ĳ���
	// * ���� 5 �����̴߳�����Ϊ 0 ��ʾ����������������CREATE_SUSPENDED ��ʾ����������ͣ
	// * ���� 6 ��ʾ lpTHreadId ���ص��߳� ID �� ���� NULL ��ʾ����Ҫ ���� ID ��
	husbandThread = CreateThread(NULL, 0, husband, NULL, 0, NULL);		//�����ɷ��߳�
	wifeThread = CreateThread(NULL, 0, wife, NULL, 0, NULL);			//���������߳�
	dogThread = CreateThread(NULL, 0, dog, NULL, 0, NULL);				//����С���߳�
	catThread = CreateThread(NULL, 0, cat, NULL, 0, NULL);				//����Сè�߳�

	//���̵߳Ľ���
	WaitForSingleObject(husbandThread, INFINITE);						//�ȴ��ɷ��߳̽���
	WaitForSingleObject(wifeThread, INFINITE);							//�ȴ������߳̽���
	WaitForSingleObject(dogThread, INFINITE);							//�ȴ�С���߳̽���
	WaitForSingleObject(catThread, INFINITE);							//�ȴ�Сè�߳̽���

	//�ر��߳̾��  
	CloseHandle(husbandThread);											//�ر��ɷ��߳�
	CloseHandle(wifeThread);											//�ر������߳�
	CloseHandle(dogThread);												//�ر�С���߳�
	CloseHandle(catThread);												//�ر�Сè�߳�

	//�ر��ź������  
	CloseHandle(EmptyPlate);											//�رտ����Ӿ��
	CloseHandle(wCoco);													//�رպ��ɿ������
	CloseHandle(bCoco);													//�رհ��ɿ������

	return 0;
}


//�ɷ��߳�
DWORD WINAPI husband(LPVOID IpParameter)
{
	for (int i = 0; i < num; ++i) 
	{
		WaitForSingleObject(EmptyPlate, INFINITE);				//P����  
		// ��ʼ�ٽ���
		bConoNum++;
		cout << "\n�ɷ������з�һ�����ɿ���\n";
		cout << "�����������" << ((bConoNum == 1) ? "��" : "��") << endl;
		// �����ٽ���  
		ReleaseSemaphore(bCoco, 1, NULL);						//V����  
		Sleep(1000);
	}
	return 0;
}

//�����߳�
DWORD WINAPI wife(LPVOID IpParmeter)
{
	for (int i = 0; i < num; ++i) 
	{
		WaitForSingleObject(EmptyPlate, INFINITE);				//P����  
		// ��ʼ�ٽ���  
		wConoNum++;
		cout << "\n���������з�һ�����ɿ�\n";
		cout << "�����������" << (( bConoNum == 1) ? "��" : "��") << endl;
		// �����ٽ���  
		ReleaseSemaphore(wCoco, 1, NULL);						//V����  
		Sleep(500);
	}
	return 0;
}

//С���߳�
DWORD WINAPI dog(LPVOID IpParameter)
{
	for (int i = 0; i < num; ++i)
	{
		WaitForSingleObject(bCoco, INFINITE); //p����  
		bConoNum--;
		cout << "С���Ժ��ɿ�!" << endl;
		ReleaseSemaphore(EmptyPlate, 1, NULL); //v����  
	}
	return 0;
}

//Сè�߳�
DWORD WINAPI cat(LPVOID IpParameter)
{
	for (int i = 0; i < num; ++i)
	{
		WaitForSingleObject(wCoco, INFINITE); //p����  
		wConoNum--;
		cout << "Сè�԰��ɿ���!" << endl;
		ReleaseSemaphore(EmptyPlate, 1, NULL); //v����  
	}
	return 0;
}
