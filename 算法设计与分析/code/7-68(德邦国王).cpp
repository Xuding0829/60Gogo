#include <bits/stdc++.h>

using namespace std;

const int N = 10;

vector<pair<int, int>> q;
int a[N][N];
int s[N][N];
bool st[N][N];
int n, k, m;
int mincnt = 0x3f3f3f3f;
int X, Y;

int Getsum() {
    int sum = 0;
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            if (a[i][j] == s[i][j]) sum++;
        }
    }
    return sum;
}

void dfs(int cnt) {
    int sum = Getsum();
    if (sum == n * n) {
        if (cnt < mincnt) {
            mincnt = cnt;
        }
        return;
    }

    if (cnt >= mincnt) return;

    if (cnt > m) return;

    if (m - cnt < n * n - sum - 1) return;

    for (int i = 0; i < k; i++) {
        int x = q[i].first, y = q[i].second;
        if (X + x > n || X + x < 1 || Y + y > n || Y + y < 1) continue;
        swap(a[X][Y], a[X + x][Y + y]);
        int oldx = X, oldy = Y;
        X = X + x, Y = Y + y;
        dfs(cnt + 1);

        //还原
        X = oldx, Y = oldy;
        swap(a[X][Y], a[X + x][Y + y]);
    }

    return;
}

int main() {
    cin >> n >> k >> m;
    for (int i = 0; i < k; i++) {
        int x, y;
        cin >> x >> y;
        q.push_back({x, y});
    }

    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            cin >> a[i][j];
            if (a[i][j] == 2) {
                X = i, Y = j;
            }
        }
    }
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            cin >> s[i][j];
        }
    }

    dfs(0);
    if (mincnt <= m) cout << mincnt << endl;
    else cout << -1 << endl;
}