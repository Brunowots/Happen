/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_MAP_MAP_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_MAP_MAP_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"
#include "lua/functions/map/house_functions.hpp"
#include "lua/functions/map/position_functions.hpp"
#include "lua/functions/map/teleport_functions.hpp"
#include "lua/functions/map/tile_functions.hpp"
#include "lua/functions/map/town_functions.hpp"

class MapFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			HouseFunctions::init(L);
			PositionFunctions::init(L);
			TeleportFunctions::init(L);
			TileFunctions::init(L);
			TownFunctions::init(L);
		}

	private:
};

#endif // SRC_LUA_FUNCTIONS_MAP_MAP_FUNCTIONS_HPP_
