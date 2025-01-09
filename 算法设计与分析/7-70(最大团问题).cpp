#include <bits/stdc++.h>

using namespace std;

const int N = 55;

bool g[N][N];
int n, ans;
vector<int> v;

bool check(int i) {
    for (auto x : v) {
        if (!g[i][x]) return false;
    }

    return true;
}

void dfs(int u, int cnt) {
    if (cnt > ans) ans = cnt;

    for (int i = u + 1; i <= n; i++) {
        if (check(i)) {
            v.push_back(i);
            dfs(i, cnt + 1); 
            v.pop_back();
        }
    }

    return;
}

int main() {
    while (cin >> n && n) {
        ans = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                cin >> g[i][j];
            }
        }
        for (int i = 1; i <= n; i++) {
            v.push_back(i);
            dfs(i, 1);
            v.clear();
        }
        cout << ans << endl;
    }

    return 0;
}