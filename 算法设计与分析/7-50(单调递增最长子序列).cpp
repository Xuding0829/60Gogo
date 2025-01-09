#include <bits/stdc++.h>

using namespace std;

const int N = 1010;

int a[N], f[N];
int n;

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
    }

    for (int i = 1; i <= n; i++) {
        f[i] = 1;
        for (int j = 1; j < i; j++) {
            if (a[j] < a[i]) {
                f[i] = max(f[i], f[j] + 1);
            }
        }
    }
    int res = 1;
    for (int i = 1; i <= n; i++) {
        res = max(res, f[i]);
    }
    cout << res << endl;

    return 0;
}
