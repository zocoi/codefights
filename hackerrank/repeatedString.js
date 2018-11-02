function repeatedString(s, n) {
    let repeated_times = Math.floor(n / s.length)
    let a_indexes = []
    let total = 0
    s.split("").forEach(function (c, i) {
        if (c == "a") {
            a_indexes.push(i)
        }
    })
    total = a_indexes.length * repeated_times
    let mod = n % s.length
    console.log("a_indexes", a_indexes, mod);
    
    for (const i of a_indexes) {
        console.log("i", i);
        
        if (i >= mod) { break }
        console.log("after break", i);
        total += 1
    }
    return total

}

const result = repeatedString("gfcaaaecbg", 547602)
console.log(result)
console.log(164280)
