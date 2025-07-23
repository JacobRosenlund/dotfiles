def clamp (n, minimum, maximum):
    if n < minimum:
        return minimum
    elif n > maximum:
        return maximum
    return n
