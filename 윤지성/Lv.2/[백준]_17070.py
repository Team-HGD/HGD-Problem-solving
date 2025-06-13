// https://www.acmicpc.net/problem/17070
import sys

n = int(sys.stdin.readline())
board = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
boardCnt = [[[0 for _ in range(3)] for _ in range(n)] for _ in range(n)] # 0 -> 세로, 1 -> 가로, 2-> 대각선
boardCnt[0][1][1] = 1
answer = 0

for row in range(n):
    for col in range(n):
        cnt = 0
        if row == 0 and col == 1:
            continue
        if board[row][col] == 1:
             continue
        if row > 1: # 세로 -> 세로
            boardCnt[row][col][0] += boardCnt[row - 1][col][0] # 세로
        if row > 1 and col > 0: # 세로 -> 대각선
            if board[row - 1][col] == 0 and board[row][col - 1] == 0:
                boardCnt[row][col][2] += boardCnt[row - 1][col - 1][0]

        if col > 1: # 가로 -> 가로
            boardCnt[row][col][1] += boardCnt[row][col - 1][1]
        if col > 1 and row > 0: # 가로 -> 대각선
            if board[row - 1][col] == 0 and board[row][col - 1] == 0:
                boardCnt[row][col][2] += boardCnt[row - 1][col - 1][1]

        if row > 1 and col > 0: # 대각선 -> 세로
            boardCnt[row][col][0] += boardCnt[row - 1][col][2] # 대각선 -> 세로
        if row > 0 and col > 1: # 대각선 -> 가로
            boardCnt[row][col][1] += boardCnt[row][col - 1][2] # 대각선 -> 세로
        if row > 1 and col > 1:  # 대각선 -> 대각선
            if board[row - 1][col] == 0 and board[row][col - 1] == 0:
                boardCnt[row][col][2] += boardCnt[row - 1][col - 1][2]

print(boardCnt[n - 1][n - 1][0] + boardCnt[n - 1][n - 1][1] + boardCnt[n - 1][n - 1][2])
