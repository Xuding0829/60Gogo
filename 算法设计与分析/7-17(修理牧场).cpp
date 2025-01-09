#include <bits/stdc++.h>

using namespace std;

const int N = 10010;

int n;

int main() {
    cin >> n;
    priority_queue<int, vector<int>, greater<int>> a;
    for (int i = 0; i < n; i++) {
        int x;
        cin >> x;
        a.push(x);
    }
    int tmp, sum = 0;
    while (a.size() > 1) {
        tmp = a.top();
        a.pop();
        tmp += a.top();
        a.pop();
        a.push(tmp);
        sum += tmp; 
    }

    cout << sum << endl;

    return 0;
}