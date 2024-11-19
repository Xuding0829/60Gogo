#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int f[N][N];
string a, b;

int main() {
    cin >> a >> b;
    int n = a.length(), m = b.length();
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (a[i - 1] == b[j - 1]) {
                f[i][j] = f[i - 1][j - 1] + 1;
            } else {
                f[i][j] = max(f[i - 1][j], f[i][j - 1]);
            }
        }
    }
    cout << f[n][m] << endl;

    return 0;
}