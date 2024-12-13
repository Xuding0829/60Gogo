#include <bits/stdc++.h>

using namespace std;

int n;

int main() {
    cin >> n;
    int cnt1, cnt2, cnt3;
    cnt1 = n / 5;
    n %= 5;
    cnt2 = n / 2;
    n %= 2;
    cnt3 = n;

    cout << "fen5:" << cnt1 << ", fen2:" << cnt2 << ", fen1:"<< cnt3 << ", total:" << cnt1 + cnt2 + cnt3 << endl;
    return 0;
}