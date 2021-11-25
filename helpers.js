const NumToTime = (nums) => {
    let minutes = 0;

    while (nums >= 60) {
        minutes += 1;
        nums -= 60;
    }

    if (nums < 10)
    {
        nums = `0${nums}`;
    }

    let result = `${minutes}:${nums}`;
    return result;
}
