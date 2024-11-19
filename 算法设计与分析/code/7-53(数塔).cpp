// #include <bits/stdc++.h>

// using namespace std;

// const int N = 1010;

// int f[N][N];
// int a[N][N];
// int T, n;

// int main() {
//     cin >> T;
//     while (T--) {
//         cin >> n;
//         for (int i = 0; i < n; i++) {
//             for (int j = 0; j < N; j++) {
//                 f[i][j] = -0x3f3f3f3f;
//                 a[i][j] = 0;
//             }
//         }
        
//         for (int i = 1; i <= n; i++) {
//             for (int j = 1; j <= i; j++) {
//                 int x;
//                 cin >> x;
//                 a[i][(2 * n - 1) / 2 + 1 - i + 1 + (j - 1) * 2] = x;
//             }
//         }
        
//         f[1][(2 * n - 1) / 2 + 1] = a[1][(2 * n - 1) / 2 + 1];
//         for (int i = 2; i <= n; i++) {
//             for (int j = 1; j <= i; j++) {
//                 int x = (2 * n - 1) / 2 + 1 - i + 1 + (j - 1) * 2;
//                 f[i][x] = max(f[i - 1][x - 1], f[i - 1][x + 1]) + a[i][x];
//             }
//         }
//     }
//     int res = -0x3f3f3f3f;
//     for (int i = 1; i <= 2 * n - 1; i += 2) {
//         res = max(res, f[n][i]);
//     }

//     cout << res << endl;

//     for (int i = 1; i <= n; i++) {
//         for (int j = 1; j <= 2 * n - 1; j++) {
//             cout << a[i][j] << ' ';
//         }
//         cout << endl;
//     }
//     for (int i = 1; i <= n; i++) {
//         for (int j = 1; j <= 2 * n - 1; j++) {
//             if (f[i][j] == -0x3f3f3f3f) cout << 0 << ' ';
//             else cout << f[i][j] << ' ';
//         }
//         cout << endl;
//     }

//     return 0;
// }
#include <bits/stdc++.h>

using namespace std;

const int N = 110;

int f[N][N]; 
int a[N][N];
int T, n;

int main() {
    cin >> T;
    while (T--) {
        cin >> n;
        for (int i = 1; i <= n; i++) {
            for (int j = 0; j <= n + 1; j++) {
                f[i][j] = -0x3f3f3f3f;
            }
        }

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                cin >> a[i][j];
            }
        }

        f[1][1] = a[1][1];
        for (int i = 2; i <= n; i++) {
            for (int j = 1; j <= i; j++) {
                f[i][j] = max(f[i - 1][j], f[i - 1][j - 1]) + a[i][j];
            }
        }

        int res = -0x3f3f3f3f;
        for (int i = 1; i <= n; i++) {
            res = max(res, f[n][i]);
        }

        cout << res << endl;
    } 
    return 0;
}