#include <bits/stdc++.h>

using namespace std;

long long qmi(long long a, long long b, long long c) {
    long long sum = 1;
    while (b) {
        if (b & 1) {
            sum = (sum * a) % c;
        }
        a = (a * a) % c;
        b >>= 1;
    }
    
    return sum;
}

int main() {
    long long a, b, c;
    int T;
    cin >> T;
    while (T--) {
        cin >> a >> b >> c;
        cout << qmi(a, b, c) << endl;
    }
    return 0;
}