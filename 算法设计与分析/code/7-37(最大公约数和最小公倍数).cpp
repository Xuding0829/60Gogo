#include <bits/stdc++.h>

using namespace std;

int gcd(int a, int b) {
    if (a % b == 0) {
        return b;
    } else {
        return gcd(b, a % b);
    }
}

int main() {
    int x, y;
    cin >> x >> y;
    if (x < y) swap(x, y);
    int n = gcd(x, y);
    int m = x * y / n;

    cout << n << ' ' << m << endl;

    return 0;
}