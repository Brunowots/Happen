/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_MAP_POSITION_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_MAP_POSITION_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class PositionFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "Position", "", PositionFunctions::luaPositionCreate);
			registerMetaMethod(L, "Position", "__add", PositionFunctions::luaPositionAdd);
			registerMetaMethod(L, "Position", "__sub", PositionFunctions::luaPositionSub);
			registerMetaMethod(L, "Position", "__eq", PositionFunctions::luaPositionCompare);

			registerMethod(L, "Position", "getDistance", PositionFunctions::luaPositionGetDistance);
			registerMethod(L, "Position", "getPathTo", PositionFunctions::luaPositionGetPathTo);
			registerMethod(L, "Position", "isSightClear", PositionFunctions::luaPositionIsSightClear);

			registerMethod(L, "Position", "sendMagicEffect", PositionFunctions::luaPositionSendMagicEffect);
			registerMethod(L, "Position", "sendDistanceEffect", PositionFunctions::luaPositionSendDistanceEffect);
		}

	private:
		static int luaPositionCreate(lua_State* L);
		static int luaPositionAdd(lua_State* L);
		static int luaPositionSub(lua_State* L);
		static int luaPositionCompare(lua_State* L);

		static int luaPositionGetDistance(lua_State* L);
		static int luaPositionGetPathTo(lua_State* L);
		static int luaPositionIsSightClear(lua_State* L);

		static int luaPositionSendMagicEffect(lua_State* L);
		static int luaPositionSendDistanceEffect(lua_State* L);
};

#endif
