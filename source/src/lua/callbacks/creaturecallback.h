/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_CALLBACKS_CREATURECALLBACK_H_
#define SRC_LUA_CALLBACKS_CREATURECALLBACK_H_

#include "pch.hpp"
#include "creatures/creature.h"

class Creature;

class CreatureCallback {
	public:
		CreatureCallback(LuaScriptInterface* scriptInterface, Creature* targetCreature) :
			scriptInterface(scriptInterface), targetCreature(targetCreature) {};
		~CreatureCallback() { }

		bool startScriptInterface(int32_t scriptId);

		void pushSpecificCreature(Creature* creature);

		bool persistLuaState() {
			return params > 0 && scriptInterface->callFunction(params);
		}

		void pushCreature(Creature* creature) {
			params++;
			LuaScriptInterface::pushUserdata<Creature>(L, creature);
			LuaScriptInterface::setCreatureMetatable(L, -1, creature);
		}

		void pushPosition(const Position &position, int32_t stackpos = 0) {
			params++;
			LuaScriptInterface::pushPosition(L, position, stackpos);
		}

		void pushNumber(int32_t number) {
			params++;
			lua_pushnumber(L, number);
		}

		void pushString(const std::string &str) {
			params++;
			LuaScriptInterface::pushString(L, str);
		}

		void pushBoolean(const bool str) {
			params++;
			LuaScriptInterface::pushBoolean(L, str);
		}

	protected:
		static std::string getCreatureClass(Creature* creature);

	private:
		LuaScriptInterface* scriptInterface;
		Creature* targetCreature;
		uint32_t params = 0;
		lua_State* L = nullptr;
};

#endif // SRC_LUA_CALLBACKS_CREATURECALLBACK_H_
