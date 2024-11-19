#include <bits/stdc++.h>

using namespace std;

const int N = 300010;

int f[N][2];
int h[N], e[N], ne[N], w[N];
bool has_fa[N];
int n, idx;

void add(int a, int b) {
    e[idx] = b, ne[idx] = h[a], h[a] = idx++;
}

void dfs(int u) {
    f[u][1] = w[u];

    for (int i = h[u]; i != -1; i = ne[i]) {
        int son = e[i];
        dfs(son);
        f[u][0] += max(f[son][0], f[son][1]);
        f[u][1] += f[son][0];
    }
}

int main() {
    memset(h, -1, sizeof h);
    cin >> n;
    for (int i = 1; i <= n; i++) {
        cin >> w[i];
    }

    for (int i = 1; i < n; i++) {
        int x, y;
        cin >> x >> y;
        has_fa[x] = true;
        add(y, x);
    }
    int root = 0;
    for (int i = 1; i <= n; i++) {
        if (!has_fa[i]) {
            root = i;
            break;
        }
    }

    dfs(root);

    cout << max(f[root][0], f[root][1]) << endl;
    
    return 0;
}