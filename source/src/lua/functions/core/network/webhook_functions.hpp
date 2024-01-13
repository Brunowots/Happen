/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_NETWORK_WEBHOOK_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_NETWORK_WEBHOOK_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class WebhookFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerTable(L, "Webhook");
			registerMethod(L, "Webhook", "send", WebhookFunctions::webhookSend);
		}

	private:
		static int webhookSend(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CORE_NETWORK_WEBHOOK_FUNCTIONS_HPP_
