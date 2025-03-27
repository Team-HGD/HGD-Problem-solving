// https://www.acmicpc.net/problem/15961

#include <cstdio>
#include <cstring>

int main() {
    int n, d, k, c;
    scanf("%d %d %d %d", &n, &d, &k, &c);
    const int MOD = n;
    int * belt = new int[n];
    for (int idx = 0; idx < n; idx++) {
        int sushi;
        scanf("%d", &sushi);
        belt[idx] = sushi;
    }
    int * dishes = new int[d + 1];
    int dishes_count = 0;
    std::memset(dishes, 0, (d + 1) * sizeof(int));
    dishes[c] = 1;
    dishes_count++;
    for (int idx = 0; idx < k; idx++) {
        if (dishes[belt[idx]] == 0) dishes_count++;
        dishes[belt[idx]]++;
    }
    int answer = 0;
    int start = 0;
    while (start < n) {
        int end = start + k;
        dishes[belt[start]]--;
        if (dishes[belt[start]] == 0) dishes_count--;
        if (dishes[belt[end % MOD]] == 0) dishes_count++;
        dishes[belt[end % MOD]]++;
        answer = answer > dishes_count ? answer : dishes_count;
        start++;
    }
    printf("%d\n", answer);
    return 0;
}