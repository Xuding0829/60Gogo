
#include <cstdio>
#include <set>
using namespace std;
int father[10010];
int findFather(int x) {
    while (x != father[x])
        x = father[x];
    return x;
}
set<int> total;
void unionFather(int a, int b) {
    total.insert(a);
    total.insert(b);
    int fa = findFather(a), fb = findFather(b);
    if (fa < fb) father[fb] = fa;
    else father[fa] = fb;
}
int main() {
    for (int i = 0; i <= 10000; i++) father[i] = i;
    int n, k, t, s, q;
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%d %d", &k, &t);
        if (k == 1) unionFather(t, t);
        for (int j = 1; j < k; j++) {
            scanf("%d",&s);
            unionFather(t, s);
        }
    }
    set<int> cnt;
    for (auto it = total.begin(); it != total.end(); it++) 
        cnt.insert(findFather(*it));
    printf("%lu %lu\n", total.size(), cnt.size());
    scanf("%d", &q);
    for (int i = 0; i < q; i++) {
        scanf("%d %d", &t, &s);
        printf("%c\n", findFather(t) == findFather(s) ? 'Y' : 'N');
    }
    return 0;
}
