#include <bits/stdc++.h>

using namespace std;

const int N = 25;

bool c[N];
int n;
int a[N][N];
int mincost = 0x3f3f3f3f;

void dfs(int r, int cost) {
    if (r == n + 1) {
        if (cost < mincost) mincost = cost;
        return;
    }

    for (int j = 1; j <= n; j++) {
        if (!c[j] && cost + a[r][j] < mincost) {
            c[j] = true;
            dfs(r + 1, cost + a[r][j]);
            c[j] = false;
        }
    }
    
    return;
}

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            cin >> a[i][j];
        }
    }

    dfs(1, 0);

    cout << mincost << endl;

    return 0;
}