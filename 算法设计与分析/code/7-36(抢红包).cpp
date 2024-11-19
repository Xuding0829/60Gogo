#include <bits/stdc++.h>

using namespace std;

const int N = 10010;

struct func {
    int id;
    int get;
    int cnt;
    bool operator<(const func& other) {
        if (get > other.get) return true;
        else if (get == other.get) {
            if (cnt == other.cnt) return id < other.id;
            else return cnt > other.cnt;
        }
        else return false;
    }
}a[N];
int n, k, sum;
int M, P;

int main() {
    cin >> n;
    for (int i = 0; i <= n; i++) {
        a[i].id = i + 1;
    }
    for (int i = 0; i < n; i++) {
        cin >> k;
        sum = 0;
        for (int j = 0; j < k; j++) {
            cin >> M >> P;
            a[M - 1].get += P;
            a[M - 1].cnt++;
            sum += P;
        }
        a[i].get -= sum;
    }

    sort(a, a + n);
    for (int i = 0; i < n; i++) {
        printf("%d %.2lf\n", a[i].id, a[i].get * 1.0 / 100);
    }

    return 0;
}