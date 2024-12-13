#include <bits/stdc++.h>

using namespace std;

map<string, long long> a;
int n, k, m;
char s[20];
int x;

int main() {
    // ios::sync_with_stdio(false);
    // cin.tie(nullptr);
    
    scanf("%d%d", &n, &k);
    for (int i = 0; i < n; i++) {
        scanf("%s%d", s, &x);
        if (x < k) x = k;
        a[s] += x;
    }
    
    scanf("%d", &m);
    for (int i = 0; i < m; i++) {
        scanf("%s", s);
        if (!a[s]) printf("No Info\n");
        else printf("%d\n", a[s]);
    }

    return 0;
}