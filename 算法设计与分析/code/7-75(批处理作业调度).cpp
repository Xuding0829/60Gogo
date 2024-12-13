#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int a[N], b[N];
bool vis[N];
vector<vector<int>> ans;
vector<int> v;
vector<int> path;
int n;

void dfs() {
    if (path.size() == n) {
        ans.push_back(path);
        return;
    } 

    for (int i = 0; i < n; i++) {
        if (!vis[i]) {
            vis[i] = true;
            path.push_back(i);
            dfs();
            path.pop_back();
            vis[i] = false;
        }
    }

    return;
}

int main() {
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    for (int i = 0; i < n; i++) {
        cin >> b[i];
    }

    dfs();

    for (auto q : ans) {
        int sum1 = 0, sum2 = 0, sum3 = 0;
        for (auto k : q) {
            sum1 += a[k];
            sum2 = sum1;
            sum2 += b[k];
            sum3 += sum2;
        }
        v.push_back(sum3); 
    }
    sort(v.begin(), v.end());

    cout << v[0] << endl;

    return 0;
}