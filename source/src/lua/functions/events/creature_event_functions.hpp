/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_EVENTS_CREATURE_EVENT_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_EVENTS_CREATURE_EVENT_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class CreatureEventFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "CreatureEvent", "", CreatureEventFunctions::luaCreateCreatureEvent);
			registerMethod(L, "CreatureEvent", "type", CreatureEventFunctions::luaCreatureEventType);
			registerMethod(L, "CreatureEvent", "register", CreatureEventFunctions::luaCreatureEventRegister);
			registerMethod(L, "CreatureEvent", "onLogin", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onLogout", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onThink", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onPrepareDeath", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onDeath", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onKill", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onAdvance", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onModalWindow", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onTextEdit", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onHealthChange", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onManaChange", CreatureEventFunctions::luaCreatureEventOnCallback);
			registerMethod(L, "CreatureEvent", "onExtendedOpcode", CreatureEventFunctions::luaCreatureEventOnCallback);
		}

	private:
		static int luaCreateCreatureEvent(lua_State* L);
		static int luaCreatureEventType(lua_State* L);
		static int luaCreatureEventRegister(lua_State* L);
		static int luaCreatureEventOnCallback(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_EVENTS_CREATURE_EVENT_FUNCTIONS_HPP_
