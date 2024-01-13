/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_EVENTS_TALK_ACTION_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_EVENTS_TALK_ACTION_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class TalkActionFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "TalkAction", "", TalkActionFunctions::luaCreateTalkAction);
			registerMethod(L, "TalkAction", "onSay", TalkActionFunctions::luaTalkActionOnSay);
			registerMethod(L, "TalkAction", "register", TalkActionFunctions::luaTalkActionRegister);
			registerMethod(L, "TalkAction", "separator", TalkActionFunctions::luaTalkActionSeparator);
		}

	private:
		static int luaCreateTalkAction(lua_State* L);
		static int luaTalkActionOnSay(lua_State* L);
		static int luaTalkActionRegister(lua_State* L);
		static int luaTalkActionSeparator(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_EVENTS_TALK_ACTION_FUNCTIONS_HPP_
