#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int n;
int a[N];

void dfs(int a[], int k) {
    if (k == n) {
        for (int i = 0; i < n; i++) {
            cout << a[i] << ' ';
        }
        cout << endl;
    }
    
    for (int i = k; i < n; i++) {
        swap(a[i], a[k]);
        dfs(a, k + 1);
        swap(a[i], a[k]);
    }
}

int main() {
    cin >> n;
    for (int i = 0; i < n; i++) {
        a[i] = i + 1;
    }
    dfs(a, 0);

    return 0;
}