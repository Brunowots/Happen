/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_CORE_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_CORE_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"
#include "lua/functions/core/game/core_game_functions.hpp"
#include "lua/functions/core/libs/core_libs_functions.hpp"
#include "lua/functions/core/network/core_network_functions.hpp"

class CoreFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			CoreGameFunctions::init(L);
			CoreLibsFunctions::init(L);
			CoreNetworkFunctions::init(L);
		}

	private:
};

#endif // SRC_LUA_FUNCTIONS_CORE_CORE_FUNCTIONS_HPP_
