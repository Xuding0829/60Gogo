#include <bits/stdc++.h>

using namespace std;

const int N = 100010;

long long a[N], f[N];
int n;

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
    }

    f[1] = 1;
    for (int i = 2; i <= n; i++) 
        if (a[i] > a[i - 1]) {
            f[i] = f[i - 1] + 1;            
        } else {
            f[i] = 1;
        }
    }

    for (int i = n - 1; i >= 1; i--) {
        if (a[i] > a[i + 1] && f[i] <= f[i + 1]) {
            f[i] = f[i + 1] + 1;
        }
    }

    long long sum = 0;
    for (int i = 1; i <= n; i++) {
        sum += f[i];
    }
    cout << sum << endl;
    
    return 0;
}