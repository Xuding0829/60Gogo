#include <bits/stdc++.h>

using namespace std;

int x;

int main() {
    cin >> x;
    if (x < 100 || x > 999) {
        puts("Invalid Value.");
        return 0;
    }
    int tmp = x;
    int sum = 0;
    while (tmp) {
        int a = tmp % 10;
        sum += a * a * a;
        tmp /= 10;
    }

    if (sum == x) puts("Yes");
    else puts("No");

    return 0;
}