
colors = require("ansicolors")

local libwasm = {}

function libwasm.dump_type_section(a)
  print(colors("%{green}".."\ntype section:"))
  if a["type_section"] ~= nil then
    io.write(tostring("id:"..a["type_section"]:id()).."\n")
    io.write(tostring("payloadlength:"..a["type_section"]:payloadlength()).."\n")
    io.write(tostring("count:"..a["type_section"]:count()).."\n")
    io.write("entries"..tostring(a["type_section"]:entries()).."\n")
    for k, v in pairs(a["type_section"]:entries()) do
      io.write(v:form().."\t")
      io.write(v:param_count().."\t")
      io.write(v:param_types().."\t")
      io.write(v:return_count().."\t")
      io.write(v:return_types().."\n")
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_import_section(a)
  print(colors("%{green}".."\nimport section:"))
  if a["import_section"] ~= nil then
    io.write("id:"..tostring(a["import_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["import_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["import_section"]:count()).."\n")
    io.write("entries"..tostring(a["import_section"]:entries()).."\n")
    for k, v in pairs(a["import_section"]:entries()) do
      io.write("module length:"..v:module_length().."\t")
      io.write("module str:"..v:module_str().."\t")
      io.write("field len:"..v:field_len().."\t")
      io.write("field str:"..v:field_str().."\t")
      io.write("kind:"..v:kind().."\t")
      io.write("kind:"..tostring(v:type()).."\t")
      if v:kind() == 0 then
        print()
        io.write("kind:"..tostring(v:type()).."\n")
      --FIXME
      elseif v:kind() == 1 then
        io.write("element_type:"..v:type():element_type().."\n")
        --io.write("rsz:"..v:type():resizable_limit().."\t")
        --io.write("flags:"..v:type():resizable_limit():flags().."\t")
        --io.write("init:"..v:type():resizable_limit():init().."\t")
        --io.write("max:"..v:type():resizable_limit():maximum().."\n")
      elseif v:kind() == 2 then
        --io.write("rsz:"..v:type():resizable_limit().."\t")
        --io.write("flags:"..v:type():resizable_limit():flags().."\t")
        --io.write("init:"..v:type():resizable_limit():init().."\t")
        --io.write("max:"..v:type():resizable_limit():maximum().."\n")
        print()
      elseif v:kind() == 3 then
        io.write("value_type:"..v:type():value_type().."\t")
        io.write("mutability:"..v:type():mutability().."\n")
      end
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_function_section(a)
  print(colors("%{green}".."\nfunction section:"))
  if a["function_section"] ~= nil then
    io.write("id:"..tostring(a["function_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["function_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["function_section"]:count()).."\n")
    io.write("types:"..tostring(a["function_section"]:types()).."\n")
    for k,v in pairs(a["function_section"]:types()) do
      print(v)
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_table_section(a)
  print(colors("%{green}".."\ntable section:"))
  if a["table_section"] ~= nil then
    io.write("id:"..tostring(a["table_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["table_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["table_section"]:count()).."\n")
    io.write("entries:"..tostring(a["table_section"]:entries()).."\n")
    for k, v in pairs(a["table_section"]:entries()) do
      io.write(v:element_type().."\t")
      io.write(tostring(v:resizable_limit()).."\t")
      io.write(v:resizable_limit():flags().."\t")
      io.write(v:resizable_limit():initial().."\t")
      io.write(v:resizable_limit():maximum().."\n")
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end


function libwasm.dump_memory_section(a)
  print(colors("%{green}".."\nmemory section:"))
  if a["memory_section"] ~= nil then
    io.write("id:"..tostring(a["memory_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["memory_section"]:payloadlength()).."\n")
    --for wasm v.1.0. memory section count is 1
    --io.write("count:"..tostring(a["memory_section"]:count()).."\n")
    io.write("entries:"..tostring(a["memory_section"]:entries()).."\n")
    io.write(a["memory_section"]:entries():resizable_limit():flags().."\t")
    io.write(a["memory_section"]:entries():resizable_limit():initial().."\t")
    io.write(a["memory_section"]:entries():resizable_limit():maximum().."\n")
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_global_section(a)
  print(colors("%{green}".."\nglobal section:"))
  if (a["global_section"] ~= nil) then
    io.write("id:"..tostring(a["global_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["global_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["global_section"]:count()).."\n")
    io.write("globals:"..tostring(a["global_section"]:globals()).."\n")
    for k, v in pairs(a["global_section"]:globals()) do
      io.write(v:global_type().."\t")
      io.write(v:init().."\n")
      io.write(v:init():code().."\n")
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_export_section(a)
  print(colors("%{green}".."\nexport section:"))
  if (a["export_section"] ~= nil) then
    io.write("id:"..tostring(a["export_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["export_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["export_section"]:count()).."\n")
    io.write("entries:"..tostring(a["export_section"]:entries()).."\n")
    for k, v in pairs(a["export_section"]:entries()) do
      io.write(v:field_len().."\t")
      io.write(v:field_str().."\t")
      io.write(v:kind().."\t")
      io.write(v:index().."\n")
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_start_section(a)
  print(colors("%{green}".."\nstart section:"))
  if (a["start_section"] ~= nil) then
    io.write("id:"..tostring(a["start_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["start_section"]:payloadlength()).."\n")
    io.write("index:"..tostring(a["start_section"]:index()).."\n")
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_element_section(a)
  print(colors("%{green}".."\nelement section:"))
  if (a["element_section"] ~= nil) then
    io.write("id:"..tostring(a["element_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["element_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["element_section"]:count()).."\n")
    io.write(colors("%{cyan}".."entries:"..tostring(a["element_section"]:entries()).."\n"))
    for k, v in pairs(a["element_section"]:entries()) do
      io.write("index:"..v:index().."\t")
      io.write("init:")
      for i = 1, #v:init():code() do
        local c = v:init():code():sub(i,i)
        io.write(colors("%{red}"..string.byte(c)).." ")
      end
      io.write("\n")
      io.write("number of elements:"..v:num_length().."\t")
      io.write("elems:")
      for i, j in pairs(v:elems()) do
        io.write(colors("%{red}"..j.." "))
      end
      io.write("\n")
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_code_section(a)
  print(colors("%{green}".."\ncode section:"))
  if (a["code_section"] ~= nil) then
    io.write("id:"..tostring(a["code_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["code_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["code_section"]:count()).."\n")
    io.write("bodies:"..tostring(a["code_section"]:bodies()).."\n")
    for k,v in pairs(a["code_section"]:bodies()) do
      io.write(colors("\n%{cyan}".."entry:\n"))
      io.write("body_size:"..v:body_size().."\t")
      io.write("local_count:"..v:local_count().."\t")
      io.write(tostring(v:locals()).."\n")
      for i, j in pairs(v:locals()) do
        io.write("locals count:"..j:count().."\t")
        io.write("locals type:"..j:type().."\n")
      end
      io.write("function body:\n")
      for i,j in pairs(v:code()) do
        io.write(colors("%{red}"..j.." "))
      end
        io.write("\n")
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_data_section(a)
  print(colors("%{green}".."\ndata section:"))
  if (a["data_section"] ~= nil) then
    io.write("id:"..tostring(a["data_section"]:id()).."\n")
    io.write("payloadlength:"..tostring(a["data_section"]:payloadlength()).."\n")
    io.write("count:"..tostring(a["data_section"]:count()).."\n")
    io.write("entries:"..tostring(a["data_section"]:entries()).."\n")
    if type(a["data_section"]:entries()) == "table" then
      io.write(colors("%{cyan}".."entries:").."\n")
      for k,v in pairs(a["data_section"]:entries()) do
        io.write("index:"..v:index().."\n")
        io.write("offset: ")
        for i = 1, #v:offset():code() do
          local c = v:offset():code():sub(i,i)
          io.write(colors("%{red}"..string.byte(c)).." ")
        end
        io.write("\n")
        io.write("size:"..v:size().."\n")
        for i, j in pairs(v:data()) do
          io.write(colors("%{blue}"..string.char(j)))
        end
        io.write("\n")
      end
    end
  else
    print(colors("%{red}".."section doesnt exist."))
  end
end

function libwasm.dump_all(wasm_path)
  local a = getwasmobj(wasm_path)
  libwasm.dump_type_section(a)
  libwasm.dump_import_section(a)
  libwasm.dump_function_section(a)
  libwasm.dump_table_section(a)
  libwasm.dump_memory_section(a)
  libwasm.dump_global_section(a)
  libwasm.dump_export_section(a)
  libwasm.dump_start_section(a)
  libwasm.dump_element_section(a)
  libwasm.dump_code_section(a)
  libwasm.dump_data_section(a)
end

function libwasm.dev(wasm_path)
  local a = getwasmobj(wasm_path)
  libwasm.dump_import_section(a)
end

function libwasm.demo_getters(wasm_path)
  local a = getwasmobj(wasm_path)
  print(a)
  print(type(a))
  for k, v in pairs(a) do
    print(k, v, type(k), type(v))
  end
  libwasm.dump_type_section(a)
  libwasm.dump_import_section(a)
  libwasm.dump_function_section(a)
  libwasm.dump_table_section(a)
  libwasm.dump_memory_section(a)
  libwasm.dump_global_section(a)
  libwasm.dump_export_section(a)
  libwasm.dump_start_section(a)
  libwasm.dump_element_section(a)
  libwasm.dump_code_section(a)
  libwasm.dump_data_section(a)
end

function libwasm.demo_setters(wasm_path)
  local a = getwasmobj(wasm_path)
  wasmextra = require("wasmextra")

  --type section setters
  do
    print("type section setters:")

    if a["type_section"] ~= nil then
      local pre = a["type_section"]:id()
      a["type_section"]:set_id(10)
      local post = a["type_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."type_section:id:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."type_section:id:pass\n"))
      end

      pre = a["type_section"]:payloadlength()
      a["type_section"]:set_payloadlength(10)
      post = a["type_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."type_section:payloadlength:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."type_section:payloadlength:pass\n"))
      end

      pre = a["type_section"]:count()
      a["type_section"]:set_count(13)
      post = a["type_section"]:count()
      -- not necessary anymore since the library code checks for null before dereferencing
      -- though that only works if we used calloc instead of malloc
      a["type_section"]:set_count(pre)
      if pre == post then
        io.write(colors("%{red}".."type_section:count:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."type_section:count:pass\n"))
      end

      --for k,v in pairs(W_Type_Section_Entry) do
        --print(k, v)
      --end
      print(#a["type_section"]:entries())
      local entry1 = W_Type_Section_Entry(1,2,3,4,5)
      local entry2 = W_Type_Section_Entry(1,2,3,4,5)
      local entry3 = W_Type_Section_Entry(1,2,3,4,5)
      local new_entries = {}
      new_entries[1] = entry1
      new_entries[2] = entry2
      new_entries[3] = entry2
      pre = a["type_section"]:entries()
      a["type_section"]:set_entries(new_entries)
      a["type_section"]:set_count(3)
      print(#a["type_section"]:entries())
      post = a["type_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."type_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."type_section:entries:pass\n"))
      end
      for k,v in pairs(a["type_section"]:entries()) do
        print("form:"..v:form())
        print("param_count:"..v:param_count())
        print("param_types:"..v:param_types())
        print("return_count:"..v:return_count())
        print("return_types:"..v:return_types())
      end
    end
  end

  --import section setters
  do
    print("import section setters:")

    if a["import_section"] ~= nil then
      local pre = a["import_section"]:id()
      a["import_section"]:set_id(10)
      local post = a["import_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."import_section:id:failure\n"))
      else
        io.write(colors("%{green}".."import_section:id:pass\n"))
      end

      pre = a["import_section"]:payloadlength()
      a["import_section"]:set_payloadlength(222)
      post = a["import_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."import_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."import_section:payloadlength:pass\n"))
      end

      pre = a["import_section"]:count()
      a["import_section"]:set_count(13)
      post = a["import_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."import_section:count:failure\n"))
      else
        io.write(colors("%{green}".."import_section:count:pass\n"))
      end

      --FIXME-entries
      local entry1 = W_Import_Section_Entry()
      local entry2 = W_Import_Section_Entry()
      local entry3 = W_Import_Section_Entry()
      local entry4 = W_Import_Section_Entry()
      local kind0 = 12345
      local rsz = resizable_limit_t(111,222,333)
      local rsz1 = resizable_limit_t(11,22,33)
      local kind1 = table_type_t(10, rsz)
      kind1:set_resizable_limit(rsz)
      local kind2 = memory_type_t(rsz1)
      kind2:set_resizable_limit(rsz1)
      local kind3 = global_type_t(13,13)

      entry1:set_module_length(3)
      entry1:set_module_str("env")
      entry1:set_field_len(2)
      entry1:set_field_str("ab")
      entry1:set_kind(0)
      entry1:set_type(kind0)

      entry2:set_module_length(3)
      entry2:set_module_str("env")
      entry2:set_field_len(3)
      entry2:set_field_str("abc")
      entry2:set_kind(1)
      entry2:set_type(kind1)

      entry3:set_module_length(3)
      entry3:set_module_str("env")
      entry3:set_field_len(4)
      entry3:set_field_str("abcd")
      entry3:set_kind(2)
      entry3:set_type(kind2)

      entry4:set_module_length(3)
      entry4:set_module_str("env")
      entry4:set_field_len(5)
      entry4:set_field_str("abcde")
      entry4:set_kind(3)
      entry4:set_type(kind3)

      local entries = {}
      entries[1] = entry1
      entries[2] = entry2
      entries[3] = entry3
      entries[4] = entry4

      a["import_section"]:set_count(4)
      pre = a["import_section"]:entries()
      a["import_section"]:set_entries(entries)
      post = a["import_section"]:entries()

      print(colors("%{red}".."start of import seciton entry contests for settter."))
      for k,v in pairs(a["import_section"]:entries()) do
        print(k, v)
        print("module_length: "..v:module_length())
        print("module_str: "..v:module_str())
        print("field_len: "..v:field_len())
        print("field_str: "..v:field_str())
        print("kind: "..v:kind())
        --print(v:type())
        --print(colors("%{green}"..type(v:type()).."\n"))
        --[[
        if v:kind() == 0 then
          v:set_type(54321)
          print(v:type())
        end
        ]]--
        if v:kind() == 1 then
          --io.write(colors("%{blue}"..v:type():element_type().."\n"))
          io.write(colors("%{blue}"..v:type():resizable_limit():flags().."\n"))
          io.write(colors("%{blue}"..v:type():resizable_limit():initial().."\n"))
          io.write(colors("%{blue}"..v:type():resizable_limit():maximum().."\n"))
        end
        if v:kind() == 2 then
          io.write(colors("%{blue}"..v:type():resizable_limit():initial().."\n"))
          io.write(colors("%{blue}"..v:type():resizable_limit():maximum().."\n"))
          io.write(colors("%{blue}"..v:type():resizable_limit():flags().."\n"))
        end
        if v:kind() == 3 then
          io.write(colors("%{blue}"..v:type():value_type().."\n"))
          io.write(colors("%{blue}"..v:type():mutability().."\n"))
        end
      end

      if pre == post then
        io.write(colors("%{red}".."import_section:entries:failure\n"))
      else
        io.write(colors("%{green}".."import_section:entries:pass\n"))
      end

      print(colors("%{red}".."end of import seciton entry contests for settter."))
    end
  end

  --function section setters
  do
    print("function section setters:")

    if a["function_section"] ~= nil then
      local pre = a["function_section"]:id()
      a["function_section"]:set_id(10)
      local post = a["function_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."function_section:id:failure\n"))
      else
        io.write(colors("%{green}".."function_section:id:pass\n"))
      end

      pre = a["function_section"]:payloadlength()
      a["function_section"]:set_payloadlength(222)
      post = a["function_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."function_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."function_section:payloadlength:pass\n"))
      end

      pre = a["function_section"]:count()
      a["function_section"]:set_count(13)
      post = a["function_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."function_section:count:failure\n"))
      else
        io.write(colors("%{green}".."function_section:count:pass\n"))
      end

      local new_types = {1,2,3,4,5}
      pre = a["function_section"]:types()
      a["function_section"]:set_count(5)
      a["function_section"]:set_types(new_types)
      post = a["function_section"]:types()
      if pre == post then
        io.write(colors("%{red}".."function_section:types:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."function_section:types:pass\n"))
      end
      for k,v in pairs(a["function_section"]:types()) do
        print(v)
      end
    end
  end

  --table section setters
  do
    print("table section setters:")

    if a["table_section"] ~= nil then
      local pre = a["table_section"]:id()
      a["table_section"]:set_id(10)
      local post = a["table_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."table_section:id:failure\n"))
      else
        io.write(colors("%{green}".."table_section:id:pass\n"))
      end

      pre = a["table_section"]:payloadlength()
      a["table_section"]:set_payloadlength(222)
      post = a["table_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."table_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."table_section:payloadlength:pass\n"))
      end

      pre = a["table_section"]:count()
      a["table_section"]:set_count(13)
      post = a["table_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."table_section:count:failure\n"))
      else
        io.write(colors("%{green}".."table_section:count:pass\n"))
      end

      local new_rsz1 = resizable_limit_t(10,20,30)
      local new_rsz2 = resizable_limit_t(10,20,30)
      local new_rsz3 = resizable_limit_t(10,20,30)
      local new_entry1 = table_type_t(1, new_rsz1)
      local new_entry2 = table_type_t(2, new_rsz2)
      local new_entry3 = table_type_t(3, new_rsz3)
      local new_entries = {}
      new_entries[1] = new_entry1
      new_entries[2] = new_entry2
      new_entries[3] = new_entry3
      a["table_section"]:set_count(1)
      pre = a["table_section"]:entries()
      a["table_section"]:set_count(3)
      a["table_section"]:set_entries(new_entries)
      post = a["table_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."table_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."table_section:entries:pass\n"))
      end
      print(#a["table_section"]:entries())
      for k,v in pairs(a["table_section"]:entries()) do
        io.write(v:element_type().."\t")
        io.write(tostring(v:resizable_limit()).."\t")
        io.write(v:resizable_limit():flags().."\t")
        io.write(v:resizable_limit():initial().."\t")
        io.write(v:resizable_limit():maximum().."\n")
      end
    end
  end

  --memory section setters
  do
    print("memory section setters:")

    if a["memory_section"] ~= nil then
      local pre = a["memory_section"]:id()
      a["memory_section"]:set_id(10)
      local post = a["memory_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."memory_section:id:failure\n"))
      else
        io.write(colors("%{green}".."memory_section:id:pass\n"))
      end

      pre = a["memory_section"]:payloadlength()
      a["memory_section"]:set_payloadlength(222)
      post = a["memory_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."memory_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."memory_section:payloadlength:pass\n"))
      end

      --for wasm v1.0. memory section count is 1 so this part doesnt make any sense
      --[[
      pre = a["memory_section"]:count()
      a["memory_section"]:set_count(13)
      post = a["memory_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."memory_section:count:failure\n"))
      else
        io.write(colors("%{green}".."memory_section:count:pass\n"))
      end
      --]]

      local new_rsz1 = resizable_limit_t(10,20,30)
      local new_memt = memory_type_t(new_rsz1)
      pre = a["memory_section"]:entries()
      a["memory_section"]:set_entries(new_memt)
      post = a["memory_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."memory_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."memory_section:entries:pass\n"))
      end
      print(a["memory_section"]:entries():resizable_limit():flags())
      print(a["memory_section"]:entries():resizable_limit():initial())
      print(a["memory_section"]:entries():resizable_limit():maximum())
    end
  end

  --global section setters
  do
    print("global section setters:")

    if a["global_section"] ~= nil then
      local pre = a["global_section"]:id()
      a["global_section"]:set_id(10)
      local post = a["global_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."global_section:id:failure\n"))
      else
        io.write(colors("%{green}".."global_section:id:pass\n"))
      end

      pre = a["global_section"]:payloadlength()
      a["global_section"]:set_payloadlength(222)
      post = a["global_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."global_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."global_section:payloadlength:pass\n"))
      end

      pre = a["global_section"]:count()
      a["global_section"]:set_count(13)
      post = a["global_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."global_section:count:failure\n"))
      else
        io.write(colors("%{green}".."global_section:count:pass\n"))
      end

      --untested
      local new_init_exp1 = init_expr_t()
      local new_g_type = global_type_t()
      local new_entry = W_Global_Entry(new_g_type, new_init_exp1)
      a["global_section"]:set_count(1)
      pre = a["global_section"]:entries()
      a["global_setion"]:set_entries()
      post = a["global_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."global_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."global_section:entries:pass\n"))
      end
      for k,v in pairs(a["global_section"]:entries()) do
      end
    end
  end

  --export section setters
  do
    print("export section setters:")

    if a["export_section"] ~= nil then
      local pre = a["export_section"]:id()
      a["export_section"]:set_id(10)
      local post = a["export_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."export_section:id:failure\n"))
      else
        io.write(colors("%{green}".."export_section:id:pass\n"))
      end

      pre = a["export_section"]:payloadlength()
      a["export_section"]:set_payloadlength(222)
      post = a["export_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."export_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."export_section:payloadlength:pass\n"))
      end

      pre = a["export_section"]:count()
      a["export_section"]:set_count(13)
      post = a["export_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."export_section:count:failure\n"))
      else
        io.write(colors("%{green}".."export_section:count:pass\n"))
      end

      local new_entry1 = W_Export_Entry(3, "abc", 10, 20)
      local new_entry2 = W_Export_Entry(3, "def", 10, 20)
      local new_entry3 = W_Export_Entry(4, "xzxy", 1, 2)
      local new_entries = {}
      new_entries[1] = new_entry1
      new_entries[2] = new_entry2
      new_entries[3] = new_entry3
      a["export_section"]:set_count(5)
      pre = a["export_section"]:entries()
      a["export_section"]:set_count(3)
      a["export_section"]:set_entries(new_entries)
      post = a["export_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."export_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."export_section:entries:pass\n"))
      end
      for k,v in pairs(a["export_section"]:entries()) do
        print(v:field_len())
        print(v:field_str())
        print(v:kind())
        print(v:index())
      end
    end
  end

  --start section setters
  do
    print("start section setters:")

    if a["start_section"] ~= nil then
      local pre = a["start_section"]:id()
      a["start_section"]:set_id(10)
      local post = a["start_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."start_section:id:failure\n"))
      else
        io.write(colors("%{green}".."start_section:id:pass\n"))
      end

      pre = a["start_section"]:payloadlength()
      a["start_section"]:set_payloadlength(222)
      post = a["start_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."start_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."start_section:payloadlength:pass\n"))
      end

      pre = a["start_section"]:index()
      a["start_section"]:set_index(13)
      post = a["start_section"]:index()
      if pre == post then
        io.write(colors("%{red}".."start_section:index:failure\n"))
      else
        io.write(colors("%{green}".."start_section:index:pass\n"))
      end
    end
  end

  --element section setters
  do
    print("element section setters:")

    if a["element_section"] ~= nil then
      local pre = a["element_section"]:id()
      a["element_section"]:set_id(10)
      local post = a["element_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."element_section:id:failure\n"))
      else
        io.write(colors("%{green}".."element_section:id:pass\n"))
      end

      pre = a["element_section"]:payloadlength()
      a["element_section"]:set_payloadlength(222)
      post = a["element_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."element_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."element_section:payloadlength:pass\n"))
      end

      pre = a["element_section"]:count()
      a["element_section"]:set_count(13)
      post = a["element_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."element_section:count:failure\n"))
      else
        io.write(colors("%{green}".."element_section:count:pass\n"))
      end

      local new_init1 = init_expr_t(string.char(65)..string.char(11))
      local new_init2 = init_expr_t(string.char(65)..string.char(33)..string.char(11))
      local new_init3 = init_expr_t(string.char(65)..string.char(11))
      local new_entry1 = W_Element_Segment(1, new_init1, 4, nil)
      --FIXME--setting elems through the lua-implementation of the constructor will segfault
      --on access. doing the same constructor in c should fix this.
      --TODO maybe passing a single elem as a lua table fixes this?
      new_entry1:set_elems({10,20,30,40})
      print(new_entry1:index())
      print(new_entry1:num_length())
      for i = 1, #new_entry1:init():code() do
        local c = new_entry1:init():code():sub(i,i)
        print(colors("%{red}"..string.byte(c)))
      end
      for i, j in pairs(new_entry1:elems()) do
        io.write(colors("%{red}"..j.." "))
      end
      local new_entry2 = W_Element_Segment(2, new_init2, 3, nil)
      new_entry2:set_elems({50,60,70})
      local new_entry3 = W_Element_Segment(3, new_init3, 2, nil)
      new_entry3:set_elems({80,90})
      local new_entries = {}
      new_entries[1] = new_entry1
      new_entries[2] = new_entry2
      new_entries[3] = new_entry3

      a["element_section"]:set_count(1)
      pre = a["element_section"]:entries()
      a["element_section"]:set_count(3)
      a["element_section"]:set_entries(new_entries)
      post = a["element_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."element_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."element_section:entries:pass\n"))
      end
      for k,v in pairs(a["element_section"]:entries()) do
        print(v:index())
        print(v:num_length())
        for i = 1, #new_init1:code() do
          local c = new_init1:code():sub(i,i)
          print(string.byte(c))
        end
        for i,j in pairs(v:elems()) do
          print(j)
        end
      end
    end
  end

  --code section setters
  do
    print("code section setters:")

    if a["code_section"] ~= nil then
      local pre = a["code_section"]:id()
      a["code_section"]:set_id(100)
      local post = a["code_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."code_section:id:failure\n"))
      else
        io.write(colors("%{green}".."code_section:id:pass\n"))
      end

      pre = a["code_section"]:payloadlength()
      a["code_section"]:set_payloadlength(222)
      post = a["code_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."code_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."code_section:payloadlength:pass\n"))
      end

      pre = a["code_section"]:count()
      a["code_section"]:set_count(13)
      post = a["code_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."code_section:count:failure\n"))
      else
        io.write(colors("%{green}".."code_section:count:pass\n"))
      end

      a["code_section"]:set_count(3)
      local l_entry1 = W_Local_Entry(1 ,1)
      local l_entry2 = W_Local_Entry(1 ,1)
      local l_entry3 = W_Local_Entry(1 ,1)
      local body1 = W_Function_Body(3, 1, nil, nil)
      local body2 = W_Function_Body(3, 1, nil, nil)
      local body3 = W_Function_Body(3, 1, nil, nil)
      body1:set_code({12,13,11})
      body2:set_code({12,13,11})
      body3:set_code({12,13,11})
      --FIXME-library requires you to pass a table for locals even if
      --the count is one
      body1:set_locals({l_entry1})
      body2:set_locals({l_entry2})
      body3:set_locals({l_entry3})
      local new_bodies = {}
      new_bodies[1] = body1
      new_bodies[2] = body2
      new_bodies[3] = body3

      a["code_section"]:set_count(5)
      pre = a["code_section"]:bodies()
      a["code_section"]:set_count(3)
      a["code_section"]:set_bodies(new_bodies)
      post = a["code_section"]:bodies()
      if pre == post then
        io.write(colors("%{red}".."code_section:bodies:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."code_section:bodies:pass\n"))
      end
      for k,v in pairs(a["code_section"]:bodies()) do
        print(v:body_size())
        print(v:local_count())
        --print(v:locals())
        --print(v:locals():count())
        --print(v:locals():type())
      end
    end
  end

  --data section setters
  do
    print("data section setters:")

    if a["data_section"] ~= nil then
      local pre = a["data_section"]:id()
      a["data_section"]:set_id(100)
      local post = a["data_section"]:id()
      if pre == post then
        io.write(colors("%{red}".."data_section:id:failure\n"))
      else
        io.write(colors("%{green}".."data_section:id:pass\n"))
      end

      pre = a["data_section"]:payloadlength()
      a["data_section"]:set_payloadlength(222)
      post = a["data_section"]:payloadlength()
      if pre == post then
        io.write(colors("%{red}".."data_section:payloadlength:failure\n"))
      else
        io.write(colors("%{green}".."data_section:payloadlength:pass\n"))
      end

      pre = a["data_section"]:count()
      a["data_section"]:set_count(13)
      post = a["data_section"]:count()
      if pre == post then
        io.write(colors("%{red}".."data_section:count:failure\n"))
      else
        io.write(colors("%{green}".."data_section:count:pass\n"))
      end

      local new_init1 = init_expr_t(string.char(65)..string.char(11))
      local new_init2 = init_expr_t(string.char(65)..string.char(33)..string.char(11))
      local new_init3 = init_expr_t(string.char(65)..string.char(11))
      local data_segment1 = W_Data_Segment(0, new_init1, 5, nil)
      local data_segment2 = W_Data_Segment(0, new_init2, 5, nil)
      local data_segment3 = W_Data_Segment(0, new_init3, 5, nil)
      data_segment1:set_data({11, 22, 33 ,44 ,55})
      data_segment2:set_data({11, 22, 33 ,44 ,55})
      data_segment3:set_data({11, 22, 33 ,44 ,55})
      local entries = {}
      entries[1] = data_segment1
      entries[2] = data_segment2
      entries[3] = data_segment3

      a["data_section"]:set_count(17)
      pre = a["data_section"]:entries()
      a["data_section"]:set_count(3)
      a["data_section"]:set_entries(entries)
      post = a["data_section"]:entries()
      if pre == post then
        io.write(colors("%{red}".."data_section:entries:failure\n"))
        success = false
      else
        io.write(colors("%{green}".."data_section:entries:pass\n"))
      end
      for k,v in pairs(a["data_section"]:entries()) do
        print(v:index())
        print(v:size())
        for i, j in pairs(v:data()) do
          print(j)
        end
        for i = 1, #v:offset():code() do
          local c = v:offset():code():sub(i,i)
          print(colors("%{yellow}"..string.byte(c)))
        end
      end
    end
  end

end

--FIXME-fixed?
function libwasm.demo_setter_aux()
  require("wasmextra")
  local rsz = resizable_limit_t(111,222,333)
  local zz = resizable_limit_t(11,22,33)
  local kind1 = table_type_t(10, rsz)
  local kind2 = memory_type_t(rsz)
  local kind3 = global_type_t(1,1)
  print(rsz:flags())
  print(rsz:initial())
  print(rsz:maximum())
  rsz:set_flags(100)
  rsz:set_initial(200)
  rsz:set_maximum(300)
  print(rsz:flags())
  print(rsz:initial())
  print(rsz:maximum())

  print(kind1:element_type())
  print(kind1:resizable_limit())
  kind1:set_element_type(17)
  kind1:set_resizable_limit(zz)
  print(kind1:element_type())
  print(kind1:resizable_limit())
  io.write(colors("%{blue}"..kind1:resizable_limit():initial().."\n"))
  io.write(colors("%{blue}"..kind1:resizable_limit():maximum().."\n"))
  io.write(colors("%{blue}"..kind1:resizable_limit():flags().."\n"))

  print(kind2:resizable_limit())
  kind2:set_resizable_limit(zz)
  print(kind2:resizable_limit())
  print("max after set:"..kind2:resizable_limit():maximum())

  print(kind3:value_type())
  print(kind3:mutability())
  kind3:set_value_type(0)
  kind3:set_mutability(0)
  print(kind3:value_type())
  print(kind3:mutability())
end

--libwasm.demo_setters("/home/bloodstalker/devi/hell2/bruiser/autogen/wasm/test/read.wasm")
--libwasm.dev("/home/bloodstalker/devi/hell2/bruiser/autogen/wasm/ft/test.wasm")
libwasm.demo_getters("/home/bloodstalker/extra/faultreiber/test//read.wasm")
--libwasm.demo_getters("/home/bloodstalker/devi/hell2/bruiser/autogen/wasm/test/read.wasm")
libwasm.demo_setters("/home/bloodstalker/devi/hell2/bruiser/autogen/wasm/ft/test.wasm")
--libwasm.dump_all("/home/bloodstalker/devi/hell2/bruiser/autogen/wasm/ft/test.wasm")
--libwasm.dump_all("/home/bloodstalker/devi/hell2/bruiser/autogen/wasm/test/read.wasm")
libwasm.demo_setter_aux()

return libwasm
