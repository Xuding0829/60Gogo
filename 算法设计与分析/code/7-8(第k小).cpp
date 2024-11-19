#include <bits/stdc++.h>

using namespace std;

const int N = 1000010;

int a[N], n, k;

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> n >> k;
    priority_queue<int, vector<int>, greater<int>> q;
    for (int i = 0; i < n; i++) {
        int x;
        cin >> x;
        q.push(x);
    }
    
    k--;
    while (k--) {
        q.pop();
    }
    cout << q.top() << endl;

    return 0;
}