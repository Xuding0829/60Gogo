#include <bits/stdc++.h>

using namespace std;

const int inf = 0x3f3f3f3f;

int n, m, s, d;

int main() {
    cin >> n >> m >> s >> d;
    vector<pair<int, int>> adj[n];
    vector<int> num(n, 0);
    for (int i = 0; i < n; i++) {
        cin >> num[i];
    }

    for (int i = 0; i < m; i++) {
        int u, v, w;
        cin >> u >> v >> w; 
        adj[u].push_back({v, w});
        adj[v].push_back({u, w});
    }
    
    vector<int> dis(n, inf);
    vector<int> path(n, -1);
    vector<int> pathnum(n);
    vector<int> pernum(n);
    vector<bool> vis(n, false);
    dis[s] = 0;
    pathnum[s] = 1;
    pernum[s] = num[s];   
    
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> q;
    q.push({0, s});
    while (q.size()) {
        auto [dist, u] = q.top();
        q.pop();

        if (vis[u]) continue;
        vis[u] = true;
        for (auto [v, w] : adj[u]) {
            if (dis[v] > dis[u] + w) {
                path[v] = u;
                dis[v] = dis[u] + w;
                pathnum[v] = pathnum[u];
                pernum[v] = pernum[u] + num[v];
                q.push({dis[v], v});
            } else if (dis[v] == dis[u] + w) {
                pathnum[v] += pathnum[u];
                if (pernum[v] < pernum[u] + num[v]) {
                    pernum[v] = pernum[u] + num[v];
                    path[v] = u;
                    q.push({dis[v], v});
                }
            }
        }
    } 
    cout << pathnum[d] << ' ' << pernum[d] << endl;

    function<void(int)> print = [&](int x) {
        if (x >= 0) {
            print(path[x]);
            if (x == s) cout << x;
            else cout << ' ' << x;
        }   
    };

    print(d);
    return 0;
}