// https://www.acmicpc.net/problem/13414

#include <cstdio>
#include <unordered_map>
#include <algorithm>
#include <vector>
#include <string>

bool compare_by_value(const std::pair<std::string, int> &a, const std::pair<std::string, int> &b) {
    return a.second < b.second;
}

int main() {
    int k, l;
    scanf("%d %d", &k, &l);
    std::unordered_map<std::string, int> students_map;
    for (int idx = 0; idx < l; idx++) {
        char student_number[9];
        scanf("%s", student_number);
        students_map[student_number] = idx;
    }
    std::vector<std::pair<std::string, int>> sorted_students(students_map.begin(), students_map.end());
    std::sort(sorted_students.begin(), sorted_students.end(), compare_by_value);
    int enqueued_students_count = sorted_students.size() > k ? k : sorted_students.size();
    for (int idx = 0; idx < enqueued_students_count; idx++) {
        printf("%s\n", sorted_students[idx].first.c_str());
    }
    return 0;
}
