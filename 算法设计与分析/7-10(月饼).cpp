#include <bits/stdc++.h>

using namespace std;

const int N = 1010;

struct func {
    double v;
    double p;
    double pv;
    bool operator<(const func& other) {
        return pv > other.pv;
    }
}a[N];

int n, V;

int main() {
    int n, V;
    cin >> n >> V;
    for (int i = 0; i < n; i++) {
        cin >> a[i].v;
    }
    for (int i = 0; i < n; i++) {
        cin >> a[i].p;
        a[i].pv = a[i].p / a[i].v; 
    }
    
    sort(a, a + n);

    double res = 0;
    for (int i = 0; i < n; i++) {
        if (a[i].v <= V) {
            res += a[i].p;
            V -= a[i].v;
        } else {
            res += a[i].pv * V;
            break;
        }
    }
    printf("%.2lf\n", res);

    return 0;
}