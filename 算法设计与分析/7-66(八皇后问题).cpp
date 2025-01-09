#include <bits/stdc++.h>

using namespace std;

const int N = 30;

int n;
bool ok = false;
bool a[N][N];
bool c[N], r[N], ls[N], rs[N];

void dfs(int u, int cnt) {
    //x:行  y:列
    int x = (u - 1) / n + 1;
    int y = (u - 1) % n + 1;

    // 如果前一行是空的，最后放的棋子数量肯定小于n
    if (x > 1) {
        if (!r[x - 1]) return;
    }

    // 如果成功放置了n个棋子，输出
    if (cnt == n) {
        if (ok) cout << endl;

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                if (a[i][j]) cout << 'Q';
                else cout << '.'; 

                if (j != n) cout << ' ';
            }
            cout << endl;
        }
        ok = true;
        return;
    }

    if (u > n * n + 1) return;

    // 该位置放棋子
    if (!c[y] && !r[x] && !ls[x - y + n] && !rs[x + y]) {
        a[x][y] = c[y] = r[x] = ls[x - y + n] = rs[x + y] = true;
        dfs(u + 1, cnt + 1);
        a[x][y] = c[y] = r[x] = ls[x - y + n] = rs[x + y] = false;
    }

    // 该位置不放棋子
    dfs(u + 1, cnt);

    return;
}

int main() {
    cin >> n;
    dfs(1, 0);
    if (!ok) puts("None");

    return 0;
}