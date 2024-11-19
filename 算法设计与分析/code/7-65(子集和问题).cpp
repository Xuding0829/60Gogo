#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int n;
long long c;
int a[N];
int sum;
vector<int> q;
bool ok = false;

void dfs(int u, long long w) {

    if (w == c) {
        for (auto x : q) {
            cout << x << ' ';
        }

        ok = true;
        return;
    }

    if (u > n + 1) return;
    if (ok) return;
    if (w > c) return;
    
    q.push_back(a[u]);
    dfs(u + 1, w + a[u]);
    q.pop_back();
    dfs(u + 1, w);

    return;
}

int main() {
    cin >> n >> c;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        sum += a[i];
    }    
    
    if (sum < c) {
        puts("No Solution!");
        return 0;
    }
    dfs(1, 0);
    if (!ok) puts("No Solution!");

    return 0;
}