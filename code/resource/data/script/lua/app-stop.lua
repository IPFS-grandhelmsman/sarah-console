-- Application stop script
--
local appm = import('app.stop');

local app = appm.new(executor, argv);
if ( app:check_argv() == false ) then
    return false;
end

local lock = app:getLock();
if ( lock:lock() == false ) then
    return false;
end

local status = app:stop();

lock:unlock();
return status;
