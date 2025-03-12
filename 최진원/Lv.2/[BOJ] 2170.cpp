// https://www.acmicpc.net/problem/2170

#include <cstdio>
#include <algorithm>
using Line = std::pair<int, int>;

bool compare_pair(Line a, Line b) {
    if (a.first != b.first) {
        return a.first < b.first;
    } else {
        return a.second > b.second;
    }
}

int main() {
    int n, answer = 0;
    scanf("%d", &n);
    Line * lines = new Line[n];
    for (int idx = 0; idx < n; idx++) {
        int first, second;
        scanf("%d %d", &first, &second);
        lines[idx] = second > first ? std::make_pair(first, second) : std::make_pair(second, first);
    }
    std::sort(lines, lines + n, compare_pair);
    
    int cur_start = lines[0].first, cur_end = lines[0].second;
    for (int idx = 1; idx < n; idx++) {
        if (cur_start <= lines[idx].first && lines[idx].first <= cur_end && lines[idx].second > cur_end) {
            cur_end = lines[idx].second;
        } else if (cur_end < lines[idx].first) {
            answer += cur_end - cur_start;
            cur_start = lines[idx].first;
            cur_end = lines[idx].second;
        }
    }
    if (cur_end > cur_start) {
        answer += cur_end - cur_start;
    }
    printf("%d\n", answer);
    delete[] lines;
    return 0;
}
