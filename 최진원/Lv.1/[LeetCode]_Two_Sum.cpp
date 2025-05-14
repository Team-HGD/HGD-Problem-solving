// https://leetcode.com/problems/two-sum

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<int> answer;
        vector<pair<size_t, int>> enumeratedNums;
        for (size_t index = 0; index < nums.size(); index++) {
            enumeratedNums.push_back(make_pair(index, nums[index]));
        }
        sort(
            enumeratedNums.begin(),
            enumeratedNums.end(), 
            [](const auto& a, const auto& b) { return a.second < b.second; }
        );
        for (size_t firstIndex = 0; firstIndex < nums.size(); firstIndex++) {
            auto it = lower_bound(
                enumeratedNums.begin(),
                enumeratedNums.end(),
                target - enumeratedNums[firstIndex].second,
                [](const pair <size_t, int>& a, int b) { return a.second < b; }
            );
            if (it != enumeratedNums.end() && it->second == target - enumeratedNums[firstIndex].second) {
                size_t firstOriginalIndex = enumeratedNums[firstIndex].first;
                size_t secondOriginalIndex = it->first;
                if (firstOriginalIndex != secondOriginalIndex)
                    return {(int)firstOriginalIndex, (int)secondOriginalIndex};
            }
        }
        return {};
    }
};
