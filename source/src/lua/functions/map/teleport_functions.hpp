/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_MAP_TELEPORT_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_MAP_TELEPORT_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class TeleportFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "Teleport", "Item", TeleportFunctions::luaTeleportCreate);
			registerMetaMethod(L, "Teleport", "__eq", TeleportFunctions::luaUserdataCompare);

			registerMethod(L, "Teleport", "getDestination", TeleportFunctions::luaTeleportGetDestination);
			registerMethod(L, "Teleport", "setDestination", TeleportFunctions::luaTeleportSetDestination);
		}

	private:
		static int luaTeleportCreate(lua_State* L);
		static int luaTeleportGetDestination(lua_State* L);
		static int luaTeleportSetDestination(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_MAP_TELEPORT_FUNCTIONS_HPP_
