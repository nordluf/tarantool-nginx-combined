box.cfg {
    log_level = 3,
    listen = 9999
}

box.schema.user.grant('guest', 'read,write,execute', 'universe', nil, { if_not_exists = true })

function tarantool_stored_procedure_name(req)
    return {{status="REST OK"}};
end


