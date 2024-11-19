#include <bits/stdc++.h>

using namespace std;

const int N = 55;

long long f[N];
int T, a, b;

int main() {
    cin >> T;
    while (T--) {
        cin >> a >> b;
        f[a] = 1;
        f[a + 1] = 1;
        for (int i = a + 2; i <= b; i++) {
            f[i] = f[i - 1] + f[i - 2];
        }
        cout << f[b] << endl;
    }

    return 0;
}