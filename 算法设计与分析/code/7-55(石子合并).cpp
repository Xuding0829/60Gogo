#include <bits/stdc++.h>

using namespace std;

const int N = 1010;

int a[N], s[N], f[N][N], g[N][N];  
int n;

int main() {
    cin>> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        a[i + n] = a[i];
    }
    for (int i = 1; i <= 2 * n; i++) {
        s[i] = s[i - 1] + a[i];
    }

    memset(f, 0x3f3f3f3f, sizeof f);
    memset(g, -0x3f3f3f3f, sizeof g);
    for (int i = 1; i <= 2 * n; i++) {
        f[i][i] = g[i][i] = 0;
    }
    for (int len = 1; len <= 2 * n; len++) {
        for (int i = 1; i + len - 1 <= 2 * n; i++) {
            int j = i + len - 1;
            for (int k = i; k < j; k++) {
                f[i][j] = min(f[i][j], f[i][k] + f[k + 1][j] + s[j] - s[i - 1]);
                g[i][j] = max(g[i][j], g[i][k] + g[k + 1][j] + s[j] - s[i - 1]);
            }
        }
    }
    
    int res_min = 0x3f3f3f3f, res_max = -0x3f3f3f3f;
    for (int i = 1; i <= n; i++) {
        res_min = min(res_min, f[i][i + n - 1]);
        res_max = max(res_max, g[i][i + n - 1]);
    }
    cout << res_min << endl;
    cout << res_max << endl;

    return 0;
}

