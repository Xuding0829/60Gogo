#include <bits/stdc++.h>

using namespace std;

const int N = 250;

struct m1 {
    int value;
    int rank;
    int id;
    bool operator<(const m1& other) {
        return value > other.value;
    }
}m1[N];
struct m2 {
    int value;
    int rank;
    int id;
    bool operator<(const m2& other) {
        return value > other.value;
    }
}m2[N];
struct m3 {
    double value;
    int rank;
    int id;
    bool operator<(const m3& other) {
        return value > other.value;
    }
}m3[N];
struct m4 {
    double value;
    int rank;
    int id;
    bool operator<(const m4& other) {
        return value > other.value;
    }
}m4[N];

int _Min(int r1, int r2, int r3, int r4) {
    int a = min(r1, r2);
    int b = min(r3, r4);
    return min(a, b);
}

int main() {
    int n, m;
    cin >> n >> m;
    int a, b, c;
    for (int i = 0; i < n; i++) {
        cin >> a >> b >> c;
        m1[i].value = a;
        m2[i].value = b;
        m3[i].value = a * 1.0 / c;
        m4[i].value = b * 1.0 / c;
        m1[i].id = i;
        m2[i].id = i;
        m3[i].id = i;
        m4[i].id = i;
    }
    sort(m1, m1 + n);
    sort(m2, m2 + n);
    sort(m3, m3 + n);
    sort(m4, m4 + n);

    int q, rank1, rank2, rank3, rank4;
    for (int i = 0; i < m; i++) {
        cin >> q;
        for (int j = 0, last = 0; j < n; j++) {
            if (j && m1[j].value != m1[j - 1].value) {
                last = j;
            }
            if (m1[j].id == q) {
                rank1 = last + 1;
            }

            if (j && m2[j].value != m2[j - 1].value) {
                last = j;
            }
            if (m2[j].id == q) {
                rank2 = last + 1;
            }
            if (j && m3[j].value != m3[j - 1].value) {
                last = j;
            }
            if (m3[j].id == q) {
                rank3 = last + 1;
            }
            if (j && m4[j].value != m4[j - 1].value) {
                last = j;
            }
            if (m4[j].id == q) {
                rank4 = last + 1;
            }
        }
        if (i == m - 1) {
            if (rank1 == _Min(rank1, rank2, rank3, rank4)) {
                cout << rank1 << ":1";
                continue;
            }
            if (rank2 == _Min(rank1,rank2, rank3, rank4)) {
                cout << rank2 << ":2";
                continue;
            }
            if (rank3 == _Min(rank1,rank2, rank3, rank4)) {
                cout << rank3 << ":3";
                continue;
            }
            if (rank4 == _Min(rank1,rank2, rank3, rank4)) {
                cout << rank4 << ":4";
                continue;
            }
        } else {
            if (rank1 == _Min(rank1, rank2, rank3, rank4)) {
                cout << rank1 << ":1 ";
                continue;
            }
            if (rank2 == _Min(rank1, rank2, rank3, rank4)) {
                cout << rank2 << ":2 ";
                continue;
            }
            if (rank3 == _Min(rank1, rank2, rank3, rank4)) {
                cout << rank3 << ":3 ";
                continue;
            }
            if (rank4 == _Min(rank1, rank2, rank3, rank4)) {
                cout << rank4 << ":4 ";
                continue;
            }
        }
    }

    return 0;
} 