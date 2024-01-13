/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "lua/callbacks/creaturecallback.h"

bool CreatureCallback::startScriptInterface(int32_t scriptId) {
	if (scriptId == -1) {
		return false;
	}

	if (!scriptInterface->reserveScriptEnv()) {
		SPDLOG_ERROR(
			"[CreatureCallback::startScriptInterface] - {} {} Call stack overflow. Too many lua script calls being nested.",
			getCreatureClass(targetCreature),
			targetCreature->getName()
		);
		return false;
	}

	scriptInterface
		->getScriptEnv()
		->setScriptId(scriptId, scriptInterface);

	L = scriptInterface->getLuaState();

	scriptInterface->pushFunction(scriptId);

	return true;
}

void CreatureCallback::pushSpecificCreature(Creature* creature) {
	if (Npc* npc = creature->getNpc()) {
		LuaScriptInterface::pushUserdata<Npc>(L, npc);
	} else if (Monster* monster = creature->getMonster()) {
		LuaScriptInterface::pushUserdata<Monster>(L, monster);
	} else if (Player* player = creature->getPlayer()) {
		LuaScriptInterface::pushUserdata<Player>(L, player);
	} else {
		return;
	}

	params++;
	LuaScriptInterface::setMetatable(L, -1, getCreatureClass(creature));
}

std::string CreatureCallback::getCreatureClass(Creature* creature) {
	if (creature->getNpc()) {
		return "Npc";
	}
	if (creature->getMonster()) {
		return "Monster";
	}
	if (creature->getPlayer()) {
		return "Player";
	}

	return "";
}
