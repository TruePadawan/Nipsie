const numToTime = (nums) => {
    let minutes = 0;

    nums = parseInt(nums);
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

const updatePlaylistItems = (playlist, playlistItems) => {
    if (playlistItems.indexOf(playlist.itemSource(playlist.itemCount-1).toString()) === -1)
    {
        playlistItems.push(playlist.itemSource(playlist.itemCount-1).toString());
    }
}
