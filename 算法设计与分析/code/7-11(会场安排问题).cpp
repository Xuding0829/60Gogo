#include <bits/stdc++.h>

using namespace std;
const int N = 1000010;

int n;
int a[N], b[N];

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i] >> b[i];
    }

    sort(a + 1, a + n + 1);
    sort(b + 1, b + n + 1);
    
    int ed = 1;
    int ans = 1;
    
    for (int i = 2; i <= n; i++) {
        if (a[i] < b[ed]) {
            ans++;
        } else {
            ed++;
        }
    }

    cout << ans << endl;

    return 0;
}
