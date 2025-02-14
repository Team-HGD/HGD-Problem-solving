// https://www.acmicpc.net/problem/14729

let hw = readLine()!.split(separator:" ").map{Int(String($0))!}
let block = readLine()!.split(separator:" ").map{Int(String($0))!}

let (h,w) = (hw[0],hw[1])
var sum = 0 ,ans = 0
var left = 0 ,right = 0

for i in 0..<w
{
    if block[left] > block[i]
    {
        sum += block[left] - block[i]
    }
    else if block[left] <= block[i]
    {
        ans += sum
        sum = 0
        left = i
    }
}
right = w - 1

while(left < right)
{
    for i in stride(from:right,through: left, by: -1)
    {
        if block[right] <= block[i]
        {
            right = i
        }
        else
        {
            ans += block[right] - block[i]
        }
    }

}
print(ans)

// 문제풀이 블로그 참고..
