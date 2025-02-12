// https://www.acmicpc.net/problem/1009

# include <cstdio>
# include <vector>
using namespace std;

int main() {
    vector<vector<int>> lastTable = {
        {10},
        {1},
        {2, 4, 8, 6},
        {3, 9, 7, 1},
        {4, 6},
        {5},
        {6},
        {7, 9, 3, 1},
        {8, 4, 2, 6},
        {9, 1}
    };
    int t;
    scanf("%d", &t);
    for (int i = 0; i < t; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        a = a % 10;
        vector<int> currentTable = lastTable[a];
        int modIdx = (b % currentTable.size() - 1 + currentTable.size()) % currentTable.size();
        printf("%d\n", currentTable[modIdx]);
    }
    return 0;
}
