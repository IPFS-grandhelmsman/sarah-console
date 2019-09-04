-- lua test demo
-- 

function add(a, b)
    return a + b
end

local c = add(1, 2);
executor:appendData("the result of add(1,2)=" .. c .. "\n");
executor:appendData("This is the output from remote lua script");
