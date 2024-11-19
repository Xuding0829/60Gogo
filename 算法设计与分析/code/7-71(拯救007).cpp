#include <bits/stdc++.h>

using namespace std;

vector<pair<int, int>> q;
vector<bool> vis(100010);
int n, d;

double get_dis(pair<int, int> a, pair<int, int> b) {
    return sqrt(pow(a.first - b.first, 2) + pow(a.second - b.second, 2));
}

void dfs(int u) {
    vis[u] = true;
    
    if (abs(q[u].first - 50) <= d || abs(q[u].first + 50) <= d || abs(q[u].second - 50) <= d || abs(q[u].second + 50) <= d) {
        puts("Yes");
        exit(0);
    }

    for (int i = 0; i < n; i++) {
        if (!vis[i]) {
            if (get_dis(q[u], q[i]) <= 1.0 * d) {
                dfs(i);
            }
        }
    }

    return;
}

int main() {
    cin >> n >> d;
    for (int i = 1; i <= n; i++) {
        int x, y;
        cin >> x >> y;
        q.push_back({x, y});
    }

    vector<int> v;
    pair<int, int> st = {0, 0};
    for (int i = 0; i < n; i++) {
        if (get_dis(q[i], st) <= d + 7.5) {
            v.push_back(i);
        }
    } 

    if (v.size() == 0) {
        puts("No");
        return 0;
    }
    
    for (auto i : v) {
        dfs(i);
    }
    
    puts("No");

    return 0;
}