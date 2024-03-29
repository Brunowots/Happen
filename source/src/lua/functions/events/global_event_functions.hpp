/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_EVENTS_GLOBAL_EVENT_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_EVENTS_GLOBAL_EVENT_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class GlobalEventFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "GlobalEvent", "", GlobalEventFunctions::luaCreateGlobalEvent);
			registerMethod(L, "GlobalEvent", "type", GlobalEventFunctions::luaGlobalEventType);
			registerMethod(L, "GlobalEvent", "register", GlobalEventFunctions::luaGlobalEventRegister);
			registerMethod(L, "GlobalEvent", "time", GlobalEventFunctions::luaGlobalEventTime);
			registerMethod(L, "GlobalEvent", "interval", GlobalEventFunctions::luaGlobalEventInterval);
			registerMethod(L, "GlobalEvent", "onThink", GlobalEventFunctions::luaGlobalEventOnCallback);
			registerMethod(L, "GlobalEvent", "onTime", GlobalEventFunctions::luaGlobalEventOnCallback);
			registerMethod(L, "GlobalEvent", "onStartup", GlobalEventFunctions::luaGlobalEventOnCallback);
			registerMethod(L, "GlobalEvent", "onShutdown", GlobalEventFunctions::luaGlobalEventOnCallback);
			registerMethod(L, "GlobalEvent", "onRecord", GlobalEventFunctions::luaGlobalEventOnCallback);
			registerMethod(L, "GlobalEvent", "onPeriodChange", GlobalEventFunctions::luaGlobalEventOnCallback);
		}

	private:
		static int luaCreateGlobalEvent(lua_State* L);
		static int luaGlobalEventType(lua_State* L);
		static int luaGlobalEventRegister(lua_State* L);
		static int luaGlobalEventOnCallback(lua_State* L);
		static int luaGlobalEventTime(lua_State* L);
		static int luaGlobalEventInterval(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_EVENTS_GLOBAL_EVENT_FUNCTIONS_HPP_
