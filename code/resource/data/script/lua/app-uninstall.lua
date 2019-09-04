-- app uninstall lua script
--

local appm = import('app.uninstall');

local app = appm.new(executor, argv);
if ( app:check_argv() == false ) then
    return false;
end

local lock = app:getLock();
if ( lock:lock() == false ) then
    return false;
end

if ( app:init() == false ) then
    lock:unlock();
    return false;
end

local status = app:uninstall();

lock:unlock();
return status;
