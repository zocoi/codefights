function hourglassSum(arr) {
    let maxSum = Number.NEGATIVE_INFINITY
    for (var i = 0; i < arr.length; i++) {
        for (var j = 0; j < arr.length; j++) {

            if ((i + 2 >= arr.length) || (j + 2 >= arr[0].length)) {
                continue
            }
            // console.log(i, j, arr.length)
            let localSum = arr[i][j] + arr[i][j + 1] + arr[i][j + 2] +
                arr[i + 1][j + 1] + arr[i + 2][j] + arr[i + 2][j + 1] + arr[i + 2][j + 2]
            if (localSum > maxSum) {
                maxSum = localSum
            }
        }
    }
    return maxSum
}

arr = [
    [-1, -1, 0, -9, -2, -2],
    [-2, -1, -6, -8, -2, -5],
    [-1, -1, -1, -2, -3, -4],
    [-1, -9, -2, -4, -4, -5],
    [-7, -3, -3, -2, -9, -9],
    [-1, -3, -1, -2, -4, -5]
]

console.log(hourglassSum(arr));
