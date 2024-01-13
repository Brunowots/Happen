/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_LIBS_SPDLOG_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_LIBS_SPDLOG_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class SpdlogFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerTable(L, "Spdlog");
			registerMethod(L, "Spdlog", "info", SpdlogFunctions::luaSpdlogInfo);
			registerMethod(L, "Spdlog", "warn", SpdlogFunctions::luaSpdlogWarn);
			registerMethod(L, "Spdlog", "error", SpdlogFunctions::luaSpdlogError);
			registerMethod(L, "Spdlog", "debug", SpdlogFunctions::luaSpdlogDebug);
		}

	private:
		static int luaSpdlogDebug(lua_State* L);
		static int luaSpdlogError(lua_State* L);
		static int luaSpdlogInfo(lua_State* L);
		static int luaSpdlogWarn(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CORE_LIBS_SPDLOG_FUNCTIONS_HPP_
