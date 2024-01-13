/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#ifndef SRC_LUA_FUNCTIONS_CREATURES_PLAYER_GUILD_FUNCTIONS_HPP_
#define SRC_LUA_FUNCTIONS_CREATURES_PLAYER_GUILD_FUNCTIONS_HPP_

#include "lua/scripts/luascript.h"

class GuildFunctions final : LuaScriptInterface {
	public:
		static void init(lua_State* L) {
			registerClass(L, "Guild", "", GuildFunctions::luaGuildCreate);
			registerMetaMethod(L, "Guild", "__eq", GuildFunctions::luaUserdataCompare);

			registerMethod(L, "Guild", "getId", GuildFunctions::luaGuildGetId);
			registerMethod(L, "Guild", "getName", GuildFunctions::luaGuildGetName);
			registerMethod(L, "Guild", "getMembersOnline", GuildFunctions::luaGuildGetMembersOnline);
			registerMethod(L, "Guild", "getPoints", GuildFunctions::luaGuildGetPoints);
			registerMethod(L, "Guild", "setPoints", GuildFunctions::luaGuildSetPoints);
			registerMethod(L, "Guild", "getLevel", GuildFunctions::luaGuildGetLevel);
			registerMethod(L, "Guild", "setLevel", GuildFunctions::luaGuildSetLevel);
			registerMethod(L, "Guild", "getBankBalance", GuildFunctions::luaGuildGetBankBalance);
			registerMethod(L, "Guild", "setBankBalance", GuildFunctions::luaGuildSetBankBalance);

			registerMethod(L, "Guild", "addRank", GuildFunctions::luaGuildAddRank);
			registerMethod(L, "Guild", "getRankById", GuildFunctions::luaGuildGetRankById);
			registerMethod(L, "Guild", "getRankByLevel", GuildFunctions::luaGuildGetRankByLevel);

			registerMethod(L, "Guild", "getMotd", GuildFunctions::luaGuildGetMotd);
			registerMethod(L, "Guild", "setMotd", GuildFunctions::luaGuildSetMotd);
		}

	private:
		static int luaGuildCreate(lua_State* L);

		static int luaGuildGetId(lua_State* L);
		static int luaGuildGetName(lua_State* L);
		static int luaGuildGetMembersOnline(lua_State* L);
		static int luaGuildGetLevel(lua_State* L);
		static int luaGuildGetPoints(lua_State* L);
		static int luaGuildSetLevel(lua_State* L);
		static int luaGuildSetPoints(lua_State* L);

		static int luaGuildGetBankBalance(lua_State* L);
		static int luaGuildSetBankBalance(lua_State* L);

		static int luaGuildAddRank(lua_State* L);
		static int luaGuildGetRankById(lua_State* L);
		static int luaGuildGetRankByLevel(lua_State* L);

		static int luaGuildGetMotd(lua_State* L);
		static int luaGuildSetMotd(lua_State* L);
};

#endif // SRC_LUA_FUNCTIONS_CREATURES_PLAYER_GUILD_FUNCTIONS_HPP_
