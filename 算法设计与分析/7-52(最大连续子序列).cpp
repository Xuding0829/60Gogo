#include <bits/stdc++.h>

using namespace std;

const int N = 10010;

struct func {
    int sum;
    int st;
}f[N][2];
int a[N];
int n;

int main() {
    while (cin >> n && n) {
        bool is_all_neg = true;
        for (int i = 1; i <= n; i++) {
            cin >> a[i];
            if (a[i] >= 0) {
                is_all_neg = false;
            }
        }

        f[1][0].sum = f[1][1].sum = a[1];
        f[1][0].st = f[1][1].st = 1;

        for (int i = 2; i <= n; i++) {
            if (a[i] < 0) f[i][1].sum = -0x3f3f3f3f;
            else {
                f[i][1].sum = a[i];
                f[i][1].st = i;
            }

            if (max(f[i - 1][0].sum, f[i - 1][1].sum) < 0) {
                f[i][0].sum = -0x3f3f3f3f;
            } else {
                if (f[i - 1][1].sum > f[i - 1][0].sum) {
                    f[i][0].sum = f[i - 1][1].sum + a[i];
                    f[i][0].st = f[i - 1][1].st;
                } else {
                    f[i][0].sum = f[i - 1][0].sum + a[i];
                    f[i][0].st = f[i - 1][0].st;
                }
            }
        }

        int res = -0x3f3f3f3f;
        int st, ed;
        for (int i = 1; i <= n; i++) {
            if (f[i][0].sum >= f[i][1].sum) {
                if (res < f[i][0].sum) {
                    res = f[i][0].sum;
                    st = f[i][0].st;
                    ed = i;
                }
            } else {
                if (res < f[i][1].sum) {
                    res = f[i][1].sum;
                    st = f[i][1].st;
                    ed = i;
                }
            }
        }
        if (is_all_neg) cout << 0 << ' ' << a[1] << ' ' << a[n] << endl;
        else cout << res << ' ' << a[st] << ' ' << a[ed] << endl;
    }

    return 0;
}