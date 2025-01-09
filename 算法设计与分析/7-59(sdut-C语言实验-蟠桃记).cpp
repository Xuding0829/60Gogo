#include <bits/stdc++.h>

using namespace std;

int n;

int main() {
    int a = 1;
    cin >> n;
    for (int i = 1; i <= n - 1; i++) {
        a = (a + 1) * 2;
    }
    cout << a << endl;

    return 0;
}