#include <bits/stdc++.h>

using namespace std;

int n, res;

void hanio(int n, char a, char b, char c) {
    res++;

    if(n == 1) cout << a << "-->" << c << endl;
    else {
        hanio(n - 1, a, c, b);
        cout << a << "-->" << c << endl;
        hanio(n - 1, b, a, c);
    }
}

int main() {
    cin >> n;
    hanio(n, 'A', 'B', 'C');

    cout << res << endl;

    return 0;
}