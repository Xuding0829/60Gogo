#include <bits/stdc++.h>

using namespace std;

const int N = 55;

int f[N], a[N];
string s;
int n, T;

int main() {
    cin >> T;
    while (T--) {
        cin >> s;
        n = s.length();
        for (int i = 1; i <= n; i++) {
            a[i] = (int)s[i - 1] - 96; 
        }
        
        for (int i = 1; i <= n; i++) {
            f[i] = 1;
            for (int j = 1; j < i; j++) {
                if (a[j] < a[i]) {
                    f[i] = max(f[i], f[j] + 1);
                }
            }
        }

        int res = -0x3f3f3f3f;
        for (int i = 1; i <= n; i++) {
            res = max(res, f[i]);
        }
        cout << 26 - res << endl;
    }

    return 0;
}