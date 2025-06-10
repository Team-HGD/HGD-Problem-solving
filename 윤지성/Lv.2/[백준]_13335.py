// https://www.acmicpc.net/problem/13335
import sys
# 트럭개수, 다리길이, 최대 하중
n, w, l = map(int, sys.stdin.readline().split())

time = 0
trucks = list(map(int, sys.stdin.readline().split()))
enteringTime = [0 for i in range(n)]

left = 0
right = 0
bridgeWeight = 0
while left < n:
    time += 1
    if time - enteringTime[left] == w:
        bridgeWeight -= trucks[left]
        left += 1
    
    if right < n and trucks[right] + bridgeWeight <= l and right - left + 1 <= w:
        bridgeWeight += trucks[right]
        enteringTime[right] = time
        right += 1
print(time)
