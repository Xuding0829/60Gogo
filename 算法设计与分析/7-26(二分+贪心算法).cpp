#include <bits/stdc++.h>

using namespace std;

const int N = 110;

struct material {
    int x, y, sm, pm, sv, pv;
}a[N];
int n, m;

bool check(int mid) {
    long long sum = 0;
    for (int i = 1; i <= n; i++) {
        if (mid * a[i].x <= a[i].y) {
            cout << 1 << endl;
            continue;
        }

        int s1 = (mid * a[i].x - a[i].y) / a[i].sm + ((mid * a[i].x - a[i].y) % a[i].sm != 0);
        int _min = 0x3f3f3f3f;
        for (int j = 0; j <= s1; j++) {
            int price = j * a[i].pm;
            int need = mid * a[i].x - a[i].y - j * a[i].sm;
            if (need > 0) {
                int s2 = need / a[i].sv + (need % a[i].sv != 0);
                price += s2 * a[i].pv;
            }
            _min = min(_min, price);
        }
        
        sum += _min;
    }
    if (sum <= m) {
        return true;
    } else {
        return false; 
    }
}

int main() {
    cin >> n >> m;

    for (int i = 1; i <= n; i++) {
        cin >> a[i].x >> a[i].y >> a[i].sm >> a[i].pm >> a[i].sv >> a[i].pv;
    }
    
    int l = 1, r = 100010;
    int mid;
    while (l + 1 < r) {
        mid = (l + r) / 2;
        if (check(mid)) l = mid;
        else r = mid;
    }
    cout << l << endl;

    return 0;
}