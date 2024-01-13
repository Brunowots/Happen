/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CREATURES_PLAYER_GROUP_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CREATURES_PLAYER_GROUP_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class GroupFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "Group", "", GroupFunctions::luaGroupCreate);
			registerMetaMethod(L, "Group", "__eq", GroupFunctions::luaUserdataCompare);

			registerMethod(L, "Group", "getId", GroupFunctions::luaGroupGetId);
			registerMethod(L, "Group", "getName", GroupFunctions::luaGroupGetName);
			registerMethod(L, "Group", "getFlags", GroupFunctions::luaGroupGetFlags);
			registerMethod(L, "Group", "getAccess", GroupFunctions::luaGroupGetAccess);
			registerMethod(L, "Group", "getMaxDepotItems", GroupFunctions::luaGroupGetMaxDepotItems);
			registerMethod(L, "Group", "getMaxVipEntries", GroupFunctions::luaGroupGetMaxVipEntries);
			registerMethod(L, "Group", "hasFlag", GroupFunctions::luaGroupHasFlag);
		}

	private:
		static int luaGroupCreate(lua_State* L);

		static int luaGroupGetId(lua_State* L);
		static int luaGroupGetName(lua_State* L);
		static int luaGroupGetFlags(lua_State* L);
		static int luaGroupGetAccess(lua_State* L);
		static int luaGroupGetMaxDepotItems(lua_State* L);
		static int luaGroupGetMaxVipEntries(lua_State* L);
		static int luaGroupHasFlag(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CREATURES_PLAYER_GROUP_FUNCTIONS_HPP_
