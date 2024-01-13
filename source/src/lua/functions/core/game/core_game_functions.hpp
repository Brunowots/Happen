/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_GAME_CORE_GAME_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_GAME_CORE_GAME_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"
#include "lua/functions/core/game/config_functions.hpp"
#include "lua/functions/core/game/game_functions.hpp"
#include "lua/functions/core/game/global_functions.hpp"
#include "lua/functions/core/game/lua_enums.hpp"
#include "lua/functions/core/game/modal_window_functions.hpp"

class CoreGameFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			ConfigFunctions::init(L);
			GameFunctions::init(L);
			GlobalFunctions::init(L);
			LuaEnums::init(L);
			ModalWindowFunctions::init(L);
		}

	private:
};

#endif // SRC_LUA_FUNCTIONS_CORE_GAME_CORE_GAME_FUNCTIONS_HPP_
