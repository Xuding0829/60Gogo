#include <bits/stdc++.h>

using namespace std;

int main() {
    int n, m;
    cin >> n >> m;
    string s;
    for (int i = 0; i < n; i++) {
        cin >> s;
        int sum = 0;
        bool ok = true;
        for (int j = 0; j < s.length(); j++) {
            if (s[j] == 'S') {
                sum++;
            }
            if (sum > m) {
                ok = false;
                break;
            }
            if (s[j] == 'X') {
                sum--;
            }
            if (sum < 0) {
                ok = false;
                break;
            }
        }
        // cout << sum << endl;
        if (sum) ok = false;
        if (ok) puts("YES");
        else puts("NO");
    }
    return 0;
}
