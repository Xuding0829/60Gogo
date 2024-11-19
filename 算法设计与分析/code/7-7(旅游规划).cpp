#include <bits/stdc++.h>

using namespace std;

const int inf = 0x3f3f3f3f;

int n, m, s, d;
struct Node {
    int distance;
    int cost;
};

int main() {
    cin >> n >> m >> s >> d;
    vector<pair<int, Node>> adj[n];
    for(int i = 0; i < m; i++) {
        int u, v, w, fee;
        cin >> u >> v >> w >> fee;
        Node tnode = {w, fee};
        adj[u].push_back({v, tnode});
        adj[v].push_back({u, tnode});
    } 

    vector<bool> vis(n, false);
    vector<int> dis(n, inf);
    vector<int> cos(n, inf);
    dis[s] = 0;
    cos[s] = 0;
    
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> q;

    q.push({0, s});
    while (q.size()) {
        int u = q.top().second;
        q.pop();
        
        if (vis[u]) continue;
        vis[u] = true;

        for (auto [v, tnode] : adj[u]) {
            if (dis[v] > dis[u] + tnode.distance) {
                dis[v] = dis[u] + tnode.distance;
                cos[v] = cos[u] + tnode.cost;
                q.push({dis[v], v});
            } else if (dis[v] == dis[u] + tnode.distance) {
                cos[v] = min(cos[v], cos[u] + tnode.cost);
                q.push({dis[v], v});
            }
        }
    }

    cout << dis[d] << ' ' << cos[d] << endl;
    
    return 0;
}