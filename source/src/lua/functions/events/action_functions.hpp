/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_EVENTS_ACTION_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_EVENTS_ACTION_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class ActionFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "Action", "", ActionFunctions::luaCreateAction);
			registerMethod(L, "Action", "onUse", ActionFunctions::luaActionOnUse);
			registerMethod(L, "Action", "register", ActionFunctions::luaActionRegister);
			registerMethod(L, "Action", "id", ActionFunctions::luaActionItemId);
			registerMethod(L, "Action", "aid", ActionFunctions::luaActionActionId);
			registerMethod(L, "Action", "uid", ActionFunctions::luaActionUniqueId);
			registerMethod(L, "Action", "position", ActionFunctions::luaActionPosition);
			registerMethod(L, "Action", "allowFarUse", ActionFunctions::luaActionAllowFarUse);
			registerMethod(L, "Action", "blockWalls", ActionFunctions::luaActionBlockWalls);
			registerMethod(L, "Action", "checkFloor", ActionFunctions::luaActionCheckFloor);
			registerMethod(L, "Action", "position", ActionFunctions::luaActionPosition);
		}

	private:
		static int luaCreateAction(lua_State* L);
		static int luaActionOnUse(lua_State* L);
		static int luaActionRegister(lua_State* L);
		static int luaActionItemId(lua_State* L);
		static int luaActionActionId(lua_State* L);
		static int luaActionUniqueId(lua_State* L);
		static int luaActionPosition(lua_State* L);
		static int luaActionAllowFarUse(lua_State* L);
		static int luaActionBlockWalls(lua_State* L);
		static int luaActionCheckFloor(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_EVENTS_ACTION_FUNCTIONS_HPP_
