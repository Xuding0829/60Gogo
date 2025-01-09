#include <bits/stdc++.h>

using namespace std;

const int N = 30010;

struct Rank{
    char id[13];
    int score;
    int locate;
    int rank;
    int rankall;
    bool operator<(const Rank& r) {
        if (score > r.score) {
            return true;
        } else if (score == r.score) {
            return strcmp(id, r.id) < 0;
        } else {
            return false;
        }
    }
}a[N];

int main() {
    int n;
    cin >> n;
    int s = 0;
    for (int i = 0; i < n; i++) {
        int k;
        cin >> k;
        for (int j = 0; j < k; j++) {
            cin >> a[s].id >> a[s].score;
            a[s].locate = i + 1;
            s++;
        }
        sort(a + s - k, a + s);
        for (int q = s - k; q < s; q++) {
            a[q].rank = q - s + k + 1;
        }
        for (int q = s - k + 1; q < s; q++) {
            if (a[q].score == a[q - 1].score) {
                a[q].rank = a[q - 1].rank;
            }
        }
    }
    cout << s << endl;
    sort(a, a + s);
    for (int i = 0; i < s; i++) {
        a[i].rankall = i + 1;
    }
    for (int i = 1; i < s; i++) {
        if (a[i].score == a[i - 1].score) {
            a[i].rankall = a[i - 1].rankall;
        }
    }
    for (int i = 0; i < s; i++) {
        cout << a[i].id << ' ' << a[i].rankall << ' ' << a[i].locate << ' ' << a[i].rank << endl;
    }
    return 0;
}