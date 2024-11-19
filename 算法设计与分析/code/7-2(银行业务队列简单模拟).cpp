#include <bits/stdc++.h>

using namespace std;

int main() {
    vector<int> q1;
    vector<int> q2;
    int n;
    cin >> n;
    int x;
    for (int i = 0; i < n; i++) {
        cin >> x;
        if (x % 2) q1.push_back(x);
        if (x % 2 == 0) q2.push_back(x);
    }

    int i = 0, j = 0;
    while (i < q1.size() || j < q2.size()) {
        if (i < q1.size()) {
            if (i == 0) {
                cout << q1[i];
                i++;
                if (i < q1.size()) {
                    cout << ' ' << q1[i];
                    i++;
                }
            } else {
                cout << ' ' << q1[i];
                i++;
                if (i < q1.size()) {
                    cout << ' ' << q1[i];
                    i++;
                }
            }
        }
        if (j < q2.size()) {
            if (j == 0 && !q1.size()) {
                cout << q2[j];
                j++;
            } else {
                cout << ' ' << q2[j];
                j++;
            }
        }
    }
    
    return 0;
}