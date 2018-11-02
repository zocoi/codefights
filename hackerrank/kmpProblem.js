function failure(str = "") {
    str = str.split("")
    console.log(str);
    let kmp = [-1]
    let i = 0
    let j = -1
    while (i < str.length) {
        console.log(i, j, str[i] ,str[j])
        
        while (j >= 0 && str[i] != str[j]) {
            console.log("resetting j");   
            console.log(j, kmp[j]);
            j = kmp[j];
        }
        i++
        j++
        kmp.push(j)
    }
    return kmp.slice(1, str.length +1)
}

console.log(failure("ababx"));
