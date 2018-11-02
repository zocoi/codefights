function bonetrousle(n, k, b) {
    const low = b * (b + 1) / 2
    const high = b * k - b * (b - 1) / 2
    console.log("low, high", low, high)
    if (n >= low && n <= high) {
        const x = Math.floor((n - low) / b)
        const diff = n - (x + 1) * b - b * (b - 1) / 2
        console.log("diff", diff, "x", x);
        
        let y = []
        for (let i = x + 1; i < x + 1 + b; i++) {
            y.push(i)
        }
        const idx = (diff == 0) ? diff : y.length - diff
        console.log("y", y, y[idx], diff);
        
        const val = y[idx] + diff
        y[idx] = val
        console.log("y", y);
        return y.join(" ")
    } else {
        return "-1"
    }
}

var res = bonetrousle(12, 8, 3)
console.log(res);
// 2 3 7

var res = bonetrousle(22, 7, 6)
console.log(res);

var res = bonetrousle(809880023823305331, 906161411045895284, 52920)
console.log(res);

// 26 7 6
// 25 10 5
// 39 15 3
// 95 20 10



// 7 1 2 3 4 5
// 3 1 4 5 6 7
// 9 1 2 3 10
// 10 14 15
// 17 1 2 3 4 5 6 18 19 20