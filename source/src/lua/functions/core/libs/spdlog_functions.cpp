/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "lua/functions/core/libs/spdlog_functions.hpp"

int SpdlogFunctions::luaSpdlogInfo(lua_State* L) {
	// Spdlog.info(text)
	if (isString(L, 1)) {
		SPDLOG_INFO(getString(L, 1));
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int SpdlogFunctions::luaSpdlogWarn(lua_State* L) {
	// Spdlog.warn(text)
	if (isString(L, 1)) {
		SPDLOG_WARN(getString(L, 1));
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int SpdlogFunctions::luaSpdlogError(lua_State* L) {
	// Spdlog.error(text)
	if (isString(L, 1)) {
		SPDLOG_ERROR(getString(L, 1));
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int SpdlogFunctions::luaSpdlogDebug(lua_State* L) {
	// Spdlog.debug(text)
	if (isString(L, 1)) {
		SPDLOG_DEBUG(getString(L, 1));
	} else {
		lua_pushnil(L);
	}
	return 1;
}
