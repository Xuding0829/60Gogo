#include <bits/stdc++.h>

using namespace std;

int n, x;

bool is_prime(int x) {
    if (x <= 1) return false;
    if (x == 2) return true;
    for (int i = 2; i <= x / i; i++) {
        if (x % i == 0) return false;
    }

    return true;
}

int main() {
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> x;
        if (is_prime(x)) puts("Yes");
        else puts("No");
    }

    return 0;
}