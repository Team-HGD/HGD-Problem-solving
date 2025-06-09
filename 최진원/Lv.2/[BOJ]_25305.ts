import * as fs from "fs";

const input = fs.readFileSync(0).toString().trim().split('\n');
const [N, K] = input[0].split(' ').map(Number);
const scores: number[] = input[1].split(' ').map(Number);
scores.sort((a, b) => b - a);
console.log(scores[K - 1]);
