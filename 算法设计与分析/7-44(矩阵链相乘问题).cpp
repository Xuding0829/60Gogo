#include <bits/stdc++.h>

using namespace std;

const int N = 2200;

int f[N][N], a[N];
int n;

int main() {
    cin >> n;
    for (int i = 0; i < n + 1; i++) {
        cin >> a[i];
    }
    memset(f, 0x3f3f3f3f, sizeof f);
    for (int i = 1; i <= n; i++) {
        f[i][i] = 0;
    }

    for (int len = 2; len <= n; len++) {
        for (int i = 1; i + len - 1 <= n; i++) {
            int j = i + len - 1;
            for (int k = i; k < j; k++) {
                f[i][j] = min(f[i][j], f[i][k] + f[k + 1][j] + a[i - 1] * a[k] * a[j]);
            }
        }
    }

    cout << f[1][n] << endl;

    return 0;
}