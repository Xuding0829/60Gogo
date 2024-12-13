#include <bits/stdc++.h>

using namespace std;

int n;
vector<int> a;

int main() {
    // ios::sync_with_stdio(0);
    // cin.tie(0);
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        int x, y;
        scanf("%d%d", &x, &y);
        a.push_back(y);
    }
    sort(a.begin(), a.end());
    long long sum = 0;

    for (int i = 0; i < n / 2; i++) {
        sum += a[n - i - 1] - a[i];
    } 
    printf("%lld\n", sum);

    return 0;
}