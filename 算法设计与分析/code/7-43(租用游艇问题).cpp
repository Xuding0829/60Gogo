#include <bits/stdc++.h>

using namespace std;

const int N = 210;

int a[N][N];
int f[N];
int n;

int main() {
    cin >> n;
    for (int i = 1; i <= n - 1; i++) {
        for (int j = i + 1; j <= n; j++) {
            cin >> a[i][j];
        }    
    }

    memset(f, 0x3f3f3f3f, sizeof f);
    f[1] = 0;
    for (int i = 2; i <= n; i++) {
        for (int j = 1; j < i; j++) {
            f[i] = min(f[i], f[j] + a[j][i]);
        }
    }
    cout << f[n] << endl;

    return 0;
}