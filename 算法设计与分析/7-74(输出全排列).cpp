#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int n;
vector<int> a;
bool st[N];

void dfs(int cnt) {
    if (cnt == n) {
        for (int i = 0; i < n; i++) {
            cout << a[i];
        }
        cout << endl;
    }

    for (int i = 1; i <= n; i++) {
        if (!st[i]) {
            st[i] = true;
            a.push_back(i);
            dfs(cnt + 1);
            st[i] = false;
            a.pop_back();
        }
    }
}

int main() {
    cin >> n;
    dfs(0);

    return 0;
}