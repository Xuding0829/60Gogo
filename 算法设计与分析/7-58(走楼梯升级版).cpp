#include <bits/stdc++.h>

using namespace std;

const int N = 50;

long long f[N];
int n;

int main() {
    f[1] = 1;
    f[2] = 2;
    f[3] = 4;

    cin >> n;
    for (int i = 4; i <= n; i++) {
        f[i] = f[i - 1] + f[i - 2] + f[i - 3];
    }
    cout << f[n] << endl;

    return 0;
}