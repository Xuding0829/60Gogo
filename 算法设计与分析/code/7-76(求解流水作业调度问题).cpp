#include <bits/stdc++.h>

using namespace std;
#define N 100
//问题表示
int n;
int a[N];                //对应M1的时间
int b[N];                //对应M2的时间
struct NodeType
{
    int no;                            //作业序号
    bool group;                        //1代表第一组N1,0代表第二组N2
    int time;                        //a,b的最小时间
    bool operator<(const NodeType &s) const
    {
        return time<s.time;            //按time递增排序
    }
};
int best[N];                            //最优调度序列
 
int solve()                                //求解流水作业调度问题
{
    int i,j,k;
    NodeType c[N];
    for(i=0;i<n;i++)                    //n个作业中，求出每个作业的最小加工时间 
    {
        c[i].no=i;
        c[i].group=(a[i]<=b[i]);        //a[i]<=b[i]对应第1组N1,a[i]>b[i]对应第0组N2
        c[i].time=a[i]<=b[i]?a[i]:b[i];    //第1组存放a[i],第0组存放b[i]
    }
    sort(c,c+n);                        //c元素按time递增排序
    j=0; k=n-1;
    for(i=0;i<n;i++)                    //扫描c所有元素，产生最优调度方案
    {
        if(c[i].group==1)                
            best[j++] = c[i].no;
        else                        
            best[k--] = c[i].no;
    }
    int f1=0;                        //累计M1上的执行时间
    int f2=0;                            //最优调度下的消耗总时间
    for(i=0;i<n;i++)
    {
        f1+=a[best[i]];
        f2=max(f1,f2)+b[best[i]];
    }
    return f2;
}
 
int main()
{
    cin>>n;
    for(int i=0;i<n;i++)
        cin>>a[i]>>b[i];
    printf("%d\n",solve());
    for (int i = 0; i < n; i++) {
        if (i) cout << ' ';
        cout << best[i] + 1;
    }
    return 0;
}