#include <bits/stdc++.h>

using namespace std;

int n, k, sum;
vector<int> a;

bool is_prime(int x) {
    if (x <= 1) return false;
    if (x == 2) return true;
    for (int i = 2; i <= x / i; i++) {
        if (x % i == 0) return false;    
    }
    return true;
}

int main() {
    cin >> n >> k;
    for (int i = n; i >= 0; i--) {
        if (is_prime(i)) {
            a.push_back(i);
            sum += i;
        }
        if (a.size() == k) break;
    }
    k = a.size();
    for (int i = 0; i < k; i++) {
        if (i != k - 1) {
            cout << a[i] << '+';
        } else {
            cout << a[i] << '=';
        }
    }
    cout << sum << endl;

    return 0;
}