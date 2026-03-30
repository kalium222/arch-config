function getByProgress(list, progress) {
    progress = Math.max(0, Math.min(progress, 1))
    const index = Math.floor(progress * (list.length));
    return list[index]
}
