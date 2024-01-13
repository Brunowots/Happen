/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_GAME_CONFIG_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_GAME_CONFIG_FUNCTIONS_HPP_

#include "declarations.hpp"
#include "lua/scripts/luascript.h"

class ConfigFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L);

	private:
		static int luaConfigManagerGetFloat(lua_State* L);
		static int luaConfigManagerGetBoolean(lua_State* L);
		static int luaConfigManagerGetNumber(lua_State* L);
		static int luaConfigManagerGetString(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CORE_GAME_CONFIG_FUNCTIONS_HPP_
