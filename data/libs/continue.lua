sleep = coroutine.yield

function doSleep(co, ...)
    if coroutine.status(co) ~= 'dead' then
        local _, delay = coroutine.resume(co, ...)
        addEvent(doSleep, delay, co)
    end
end

function enableSleep(f, ...)
    if type(f) == 'function' then
        local co = coroutine.create(f)
        doSleep(co, ...)
    end
end