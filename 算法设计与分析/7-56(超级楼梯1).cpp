#include <bits/stdc++.h>

using namespace std;

const int N = 50;

long long f[N];
int n;

int main() {
    f[1] = 1;
    f[2] = 2;
    while (cin >> n) { 
        for (int i = 3; i <= n; i++) {
            f[i] = f[i - 1] + f[i - 2];
        }
        cout << f[n] << endl;
    }

    return 0;
}