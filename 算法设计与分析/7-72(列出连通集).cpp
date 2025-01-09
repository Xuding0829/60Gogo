#include <bits/stdc++.h>

using namespace std;

int n, m;

int main() {
    cin >> n >> m;

    vector<int> adj[n];
    for (int i = 0; i < m; i++) {
        int u, v;
        cin >> u >> v;
        adj[u].push_back(v);
        adj[v].push_back(u);
    }
    for (int i = 0; i < n; i++) {
        sort(adj[i].begin(), adj[i].end());
    }
    
    vector<int> res;
    vector<bool> vis(n, false);

    function<void(int)> dfs = [&](int u) {
        res.push_back(u);
        for (auto v : adj[u]) {
            if (vis[v]) continue;
            vis[v] = true;
            dfs(v);
        }
    };
    
    for (int i = 0; i < n; i++) {
        if (vis[i]) continue;
        vis[i] = true;
        dfs(i);
        cout << '{';
        for (auto x : res) {
            cout << ' ' << x;
        }
        cout << " }" << endl;
        res.clear();
    }

    fill(vis.begin(), vis.end(), false);
    
    function<void(int)> bfs = [&](int u) {
        res.push_back(u);
        queue<int> q;     
        q.push(u);
        
        while (q.size()) {
            auto u = q.front(); 
            q.pop();

            for (auto v : adj[u]) {
                if (vis[v]) continue;
                vis[v] = true;
                q.push(v);
                res.push_back(v);
            }
        }
    };

    for (int i = 0; i < n; i++) {
        if (vis[i]) continue;
        vis[i] = true;
        bfs(i);
        cout << '{';
        for (auto x : res) {
            cout << ' ' << x;
        }
        cout << " }" << endl;
        res.clear();
    }
    
    return 0;
}