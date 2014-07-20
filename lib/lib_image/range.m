% returns a range if you know the length

function R = range(start, step, length)
    R = start : step : (start + step * (length - 1));
end