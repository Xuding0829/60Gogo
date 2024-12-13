#include <bits/stdc++.h>

using namespace std;

const int N = 1010;

int f[N], v[N], w[N];
int n, c;

int main() {
    cin >> n >> c;
    for (int i = 1; i <= n; i++) {
        cin >> v[i] >> w[i];
    }
    
    for (int i = 1; i <= n; i++) 
        for (int j = c; j >= v[i]; j--) {
            f[j] = max(f[j], f[j - v[i]] + w[i]);
        }
    }

    cout << f[c] << endl;
    
    return 0;
}