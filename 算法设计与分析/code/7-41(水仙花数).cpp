#include <bits/stdc++.h>

using namespace std;

int n;

int main() {
    cin >> n;
    for (int i = pow(10, n - 1); i <= pow(10, n) - 1; i++) {
        int tmp = i;
        int sum = 0;
        while (tmp) {
            int a = tmp % 10;
            int b = a;
            for (int j = 1; j < n; j++) {
                b = b * a;
            }
            sum += b;
            tmp /= 10;
        }

        if (sum == i) cout << i << endl;
    }

    return 0;
}
