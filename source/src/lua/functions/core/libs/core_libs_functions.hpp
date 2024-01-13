/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CORE_LIBS_CORE_LIBS_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CORE_LIBS_CORE_LIBS_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"
#include "lua/functions/core/libs/bit_functions.hpp"
#include "lua/functions/core/libs/db_functions.hpp"
#include "lua/functions/core/libs/result_functions.hpp"
#include "lua/functions/core/libs/spdlog_functions.hpp"

class CoreLibsFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			BitFunctions::init(L);
			DBFunctions::init(L);
			ResultFunctions::init(L);
			SpdlogFunctions::init(L);
		}

	private:
};

#endif // SRC_LUA_FUNCTIONS_CORE_LIBS_CORE_LIBS_FUNCTIONS_HPP_
