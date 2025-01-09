#include <bits/stdc++.h>

using namespace std;

const int N = 100010;

double a[N], s[N];
int n, l;

bool check(double mid) {
    double minv = 0x3f3f3f3f;
    for (int i = 1, j = l; j <= n; i++, j++) {
        minv = min(minv, s[i - 1] - (i - 1) * mid);
        if (s[j] - j * mid - minv >= 0) {
            return true;
        }
    }
    return false;
}

int main() {
    cin >> n >> l;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        s[i] = s[i - 1] + a[i];
    }

    double l = 0, r = 2010;
    while (l + 1e-6 < r) {
        double mid = (l + r) / 2;
        if (check(mid)) l = mid;
        else r = mid;
    }
    cout << (int)(r * 1000) << endl;

    return 0;
}