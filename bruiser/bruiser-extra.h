
/***************************************************Project Mutator****************************************************/
//-*-c++-*-
/*first line intentionally left blank.*/
/*the header for mutator's code breaker.*/
/*Copyright (C) 2017 Farzad Sadeghi

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.*/
/**********************************************************************************************************************/
/*inclusion guard*/
#ifndef BRUISER_EXTRA_H
#define BRUISER_EXTRA_H
/**********************************************************************************************************************/
/*included modules*/
#include <vector>
#include <signal.h>
#include <string>
/**********************************************************************************************************************/
struct SigNames
{
  int Signal;
  char *SigName;
};

std::vector<SigNames> SignalNames = 
{
  {SIGHUP, (char*)"SIGHUP"},
  {SIGINT, (char*)"SIGINT"},
  {SIGQUIT, (char*)"SIGQUIT"},
  {SIGILL, (char*)"SIGILL"},
  {SIGTRAP, (char*)"SIGTRAP"},
  {SIGABRT, (char*)"SIGABRT"},
  {SIGIOT, (char*)"SIGIOT"},
  {SIGBUS, (char*)"SIGBUS"},
  {SIGFPE, (char*)"SIGFPE"},
  {SIGKILL, (char*)"SIGKILL"},
  {SIGUSR1, (char*)"SIGUSR1"},
  {SIGSEGV, (char*)"SIGSEGV"},
  {SIGUSR2, (char*)"SIGUSR2"},
  {SIGPIPE, (char*)"SIGPIPE"},
  {SIGALRM, (char*)"SIGALRM"},
  {SIGTERM, (char*)"SIGTERM"},
  {SIGSTKFLT, (char*)"SIGSTKFLT"},
  {SIGCHLD, (char*)"SIGCHLD"},
  {SIGCONT, (char*)"SIGCONT"},
  {SIGSTOP, (char*)"SIGSTOP"},
  {SIGTSTP, (char*)"SIGTSTP"},
  {SIGTTIN, (char*)"SIGTTIN"},
  {SIGTTOU, (char*)"SIGTTOU"},
  {SIGURG, (char*)"SIGURG"},
  {SIGXCPU, (char*)"SIGXCPU"},
  {SIGXFSZ, (char*)"SIGXFSZ"},
  {SIGVTALRM, (char*)"SIGVTALRM"},
  {SIGPROF, (char*)"SIGPROF"},
  {SIGWINCH, (char*)"SIGWINCH"},
  {SIGIO, (char*)"SIGIO"}
};

std::vector<std::string> BRUISR_COMMANDS = 
{
  "help",
  "quit",
  "exit",
  "list",
  "history",
  "shell",
  "version",
  "clear",
  "hijack",
  "m0"
};

std::vector<std::string> LUA_FUNCS = 
  {
  "_G",
  "_VERSION",
  "assert",
  "collectgarbage",
  "dofile",
  "error",
  "getmetatable",
  "ipairs",
  "load",
  "loadfile",
  "next",
  "pairs",
  "pcall",
  "print",
  "rawequal",
  "rawget",
  "rawlen",
  "rawset",
  "require",
  "select",
  "setmetatable",
  "tonumber",
  "tostring",
  "type",
  "xpcall",
  "coroutine",
  "coroutine.create",
  "coroutine.isyieldable",
  "coroutine.resume",
  "coroutine.running",
  "coroutine.status",
  "coroutine.wrap",
  "coroutine.yield",
  "debug",
  "debug.debug",
  "debug.gethook",
  "debug.getinfo",
  "debug.getlocal",
  "debug.getmetatable",
  "debug.getregistry",
  "debug.getupvalue",
  "debug.getuservalue",
  "debug.sethook",
  "debug.setlocal",
  "debug.setmetatable",
  "debug.setupvalue",
  "debug.setuservalue",
  "debug.traceback",
  "debug.upvalueid",
  "debug.upvaluejoin",
  "io",
  "io.close",
  "io.flush",
  "io.input",
  "io.lines",
  "io.open",
  "io.output",
  "io.popen",
  "io.read",
  "io.stderr",
  "io.stdin",
  "io.stdout",
  "io.tmpfile",
  "io.type",
  "io.write",
  "file:close",
  "file:flush",
  "file:lines",
  "file:read",
  "file:seek",
  "file:setvbuf",
  "file:write",
  "math",
  "math.abs",
  "math.acos",
  "math.asin",
  "math.atan",
  "math.ceil",
  "math.cos",
  "math.deg",
  "math.exp",
  "math.floor",
  "math.fmod",
  "math.huge",
  "math.log",
  "math.max",
  "math.maxinteger",
  "math.min",
  "math.mininteger",
  "math.modf",
  "math.pi",
  "math.rad",
  "math.random",
  "math.randomseed",
  "math.sin",
  "math.sqrt",
  "math.tan",
  "math.tointeger",
  "math.type",
  "math.ult",
  "os",
  "os.clock",
  "os.date",
  "os.difftime",
  "os.execute",
  "os.exit",
  "os.getenv",
  "os.remove",
  "os.rename",
  "os.setlocale",
  "os.time",
  "os.tmpname",
  "package",
  "package.config",
  "package.cpath",
  "package.loaded",
  "package.loadlib",
  "package.path",
  "package.preload",
  "package.searchers",
  "package.searchpath",
  "string",
  "string.byte",
  "string.char",
  "string.dump",
  "string.find",
  "string.format",
  "string.gmatch",
  "string.gsub",
  "string.len",
  "string.lower",
  "string.match",
  "string.pack",
  "string.packsize",
  "string.rep",
  "string.reverse",
  "string.sub",
  "string.unpack",
  "string.upper",
  "table",
  "table.concat",
  "table.insert",
  "table.move",
  "table.pack",
  "table.remove",
  "table.sort",
  "table.unpack",
  "utf8",
  "utf8.char",
  "utf8.charpattern",
  "utf8.codepoint",
  "utf8.codes",
  "utf8.len",
  "utf8.offset",
  "LUA_CPATH",
  "LUA_CPATH_5_3",
  "LUA_INIT",
  "LUA_INIT_5_3",
  "LUA_PATH",
  "LUA_PATH_5_3"
};
/**********************************************************************************************************************/
#endif
/*last line intentionally left balnk*/

