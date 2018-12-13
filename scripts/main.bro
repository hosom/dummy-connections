module dummy;

export {
    ## create_connection creates a dummy connection record to use 
    ## generic flow data with functions that require a connection
    ## record.
    global create_connection: function(orig_h: addr, orig_p: port, 
        resp_h: addr, resp_p: port): connection;
}

function create_connection(orig_h: addr, orig_p: port, 
    resp_h: addr, resp_p: port): connection
    {
    local id = conn_id($orig_h=orig_h,
        $orig_p=orig_p,
        $resp_h=resp_h,
        $resp_p=resp_p);
    
    local ep = endpoint($size=0, $state=0, $flow_label=0);

    local c = connection($id=id,
        $orig=ep,
        $resp=ep,
        $start_time=network_time(),
        $duration=1sec,
        $service=set("none"),
        $history="",
        $uid="");
    
    return c;
    }