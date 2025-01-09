#include <bits/stdc++.h>

using namespace std;

const int N = 1010;

int a[N], s[N], f[N][N];  
int n;

int main() {
    cin>> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        s[i] = s[i - 1] + a[i];
    }
    memset(f, 0x3f3f3f3f, sizeof f);
    for (int i = 1; i <= n; i++) {
        f[i][i] = 0;
    }
    for (int len = 1; len <= n; len++) {
        for (int i = 1; i + len - 1 <= n; i++) {
            int j = i + len - 1;
            for (int k = i; k < j; k++) {
                f[i][j] = min(f[i][j], f[i][k] + f[k + 1][j] + s[j] - s[i - 1]);
            }
        }
    }
    cout << f[1][n] << endl;

    return 0;
}
