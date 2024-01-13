/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_LIBS_BIT_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_LIBS_BIT_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class BitFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
#ifndef LUAJIT_VERSION
			registerTable(L, "bit");
			registerMethod(L, "bit", "bnot", BitFunctions::luaBitNot);
			registerMethod(L, "bit", "band", BitFunctions::luaBitAnd);
			registerMethod(L, "bit", "bor", BitFunctions::luaBitOr);
			registerMethod(L, "bit", "bxor", BitFunctions::luaBitXor);
			registerMethod(L, "bit", "lshift", BitFunctions::luaBitLeftShift);
			registerMethod(L, "bit", "rshift", BitFunctions::luaBitRightShift);
#endif
		}

	private:
#ifndef LUAJIT_VERSION
		static int luaBitAnd(lua_State* L);
		static int luaBitLeftShift(lua_State* L);
		static int luaBitNot(lua_State* L);
		static int luaBitOr(lua_State* L);
		static int luaBitRightShift(lua_State* L);
		static int luaBitXor(lua_State* L);
#endif
};

#endif // SRC_LUA_FUNCTIONS_CORE_LIBS_BIT_FUNCTIONS_HPP_
