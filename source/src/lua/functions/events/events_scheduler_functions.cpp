/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "game/scheduling/events_scheduler.hpp"
#include "lua/functions/events/events_scheduler_functions.hpp"

int EventsSchedulerFunctions::luaEventsSchedulergetEventSLoot(lua_State* L) {
	// EventsScheduler.getEventSLoot
	lua_pushnumber(L, g_eventsScheduler().getLootSchedule());
	return 1;
}

int EventsSchedulerFunctions::luaEventsSchedulergetEventSSkill(lua_State* L) {
	// EventsScheduler.getEventSSkill
	lua_pushnumber(L, g_eventsScheduler().getSkillSchedule());
	return 1;
}

int EventsSchedulerFunctions::luaEventsSchedulergetEventSExp(lua_State* L) {
	// EventsScheduler.getEventSExp
	lua_pushnumber(L, g_eventsScheduler().getExpSchedule());
	return 1;
}

int EventsSchedulerFunctions::luaEventsSchedulergetSpawnMonsterSchedule(lua_State* L) {
	// EventsScheduler.getSpawnMonsterSchedule
	lua_pushnumber(L, g_eventsScheduler().getSpawnMonsterSchedule());
	return 1;
}
