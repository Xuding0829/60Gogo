#include <bits/stdc++.h>

constexpr int N = 1e3 + 10;
std::vector<int> a(N), b(N), c(N);

int main()
{
    int n;
    std::cin >> n;

    for (int i = 0; i < n; i++)
        std::cin >> a[i];

    int k = 0;
    for (int i = 0; i < n; i++)
    {
        bool flag = false;
        for (int j = 0; j <= k; j++)
        {
            if (a[i] + b[j] <= 100)
            {
                b[j] += a[i];
                c[i] = j + 1;
                flag = true;
                break;
            }
        }
        if (!flag)
        {
            k++;
            b[k] += a[i];
            c[i] = k;
        }
    }

    for (int i = 0; i < n; i++)
        std::cout << a[i] << ' ' << c[i] << '\n';
    std::cout << k + 1 << '\n';
    return 0;
}