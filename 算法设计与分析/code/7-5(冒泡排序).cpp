#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int a[N];
int n, k;

int main() {
    cin >> n >> k;
    for (int i = 0; i < n; i++) {
        cin >> a[i];
    }
    for (int i = 0; i < k; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (a[j] > a[j + 1]) {
                int tmp = a[j + 1];
                a[j + 1] = a[j];
                a[j] = tmp;
            }
        }
    }
    for (int i = 0; i < n; i++) {
        if (i) cout << ' ';
        cout << a[i];
    }
}
