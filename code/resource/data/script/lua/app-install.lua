-- app install lua script
--

local appm = import('app.install');

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

local src_url  = "http://img.mineros.grandhelmsman.com/go-filecoin-dev";
local status = app:install(src_url);

lock:unlock();
return status;
