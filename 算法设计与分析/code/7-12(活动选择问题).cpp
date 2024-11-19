#include <bits/stdc++.h>

using namespace std;

const int N = 1010;

int n;
struct func {
    int st;
    int ed;
    bool operator<(const func& other) {
        return ed < other.ed;
    }
}a[N];

int main() {
    cin >> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i].st >> a[i].ed;
    }

    sort(a + 1, a + n + 1);    
    int last = a[1].ed;
    int res = 1;

    for (int i = 2; i <= n; i++) {
        if (a[i].st >= last) {
            last = a[i].ed;
            res++;
        }
    }

    cout << res << endl;
}