#include <bits/stdc++.h>

using namespace std;

vector<int> qx, qy;
int n;

int main() {
    cin >> n;
    for (int i = 0; i < n; i++) {
        int x, y;
        cin >> x >> y;
        qx.push_back(x);
        qy.push_back(y);
    }
    sort(qx.begin(), qx.end());    
    sort(qy.begin(), qy.end());   

    long long sum = 0, sumy = 0, sumx = 0; 
    for (int i = 0; i < n / 2; i++) {
        sumy += qy[n - i - 1] - qy[i];
    }

    for (int i = 0; i < n; i++) {
        qx[i] -= i;
    }
    sort(qx.begin(), qx.end());    
    for (int i = 0; i < n; i++) {
        sumx += abs(qx[i] - qx[n / 2]);
    }
    sum = sumx + sumy;
    
    cout << sum << endl;

    return 0;
}