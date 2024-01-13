/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_SCRIPTS_LUAJIT_SYNC_HPP_
#define SRC_LUA_SCRIPTS_LUAJIT_SYNC_HPP_

#if LUA_VERSION_NUM >= 502
	#ifndef LUA_COMPAT_ALL
		#ifndef LUA_COMPAT_MODULE
			#define luaL_register(L, libname, l)(luaL_newlib(L, l),
	lua_pushvalue(L, -1), lua_setglobal(L, libname))
		#endif
		#undef lua_equal
		#define lua_equal(L, i1, i2) lua_compare(L, (i1), (i2), LUA_OPEQ)
	#endif
#endif

#endif // SRC_LUA_SCRIPTS_LUAJIT_SYNC_HPP_
