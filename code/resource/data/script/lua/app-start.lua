-- Application start script
--

local appm = import('app.boot');

local app = appm.new(executor, argv);
if ( app:check_argv() == false ) then
    return false;
end

local lock = app:getLock();
if ( lock:lock() == false ) then
    return false;
end

-- check and stop the running application
app:tryStop();

if ( app:init() == false ) then
    lock:unlock();
    return false;
end

if ( app:bootup() == false ) then
    lock:unlock();
    return false;
end

-- check and to the application monitor
lock:unlock();
app:monitor();
