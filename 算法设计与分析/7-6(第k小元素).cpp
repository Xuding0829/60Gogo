#include <bits/stdc++.h>

using namespace std;

const int N = 1000010;

int a[N];
int n, k;

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);
    cin >> n >> k;
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    sort(a, a + n);
    cout << a[k - 1] << endl;
    return 0;
}