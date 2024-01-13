/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_LIBS_RESULT_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_LIBS_RESULT_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class ResultFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerTable(L, "Result");
			registerMethod(L, "Result", "getNumber", ResultFunctions::luaResultGetNumber);
			registerMethod(L, "Result", "getString", ResultFunctions::luaResultGetString);
			registerMethod(L, "Result", "getStream", ResultFunctions::luaResultGetStream);
			registerMethod(L, "Result", "next", ResultFunctions::luaResultNext);
			registerMethod(L, "Result", "free", ResultFunctions::luaResultFree);
		}

	private:
		static int luaResultFree(lua_State* L);
		static int luaResultGetNumber(lua_State* L);
		static int luaResultGetStream(lua_State* L);
		static int luaResultGetString(lua_State* L);
		static int luaResultNext(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CORE_LIBS_RESULT_FUNCTIONS_HPP_
