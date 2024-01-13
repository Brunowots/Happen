/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_NETWORK_CORE_NETWORK_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_NETWORK_CORE_NETWORK_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"
#include "lua/functions/core/network/network_message_functions.hpp"
#include "lua/functions/core/network/webhook_functions.hpp"

class CoreNetworkFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			NetworkMessageFunctions::init(L);
			WebhookFunctions::init(L);
		}

	private:
};

#endif // SRC_LUA_FUNCTIONS_CORE_NETWORK_CORE_NETWORK_FUNCTIONS_HPP_
