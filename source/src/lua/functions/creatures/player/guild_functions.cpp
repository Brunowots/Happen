/**
 * Oliveira - A Private source MMORPG server emulator
 * Update for protocol 13.16 and 13.20
 */

#include "pch.hpp"

#include "game/game.h"
#include "creatures/players/grouping/guild.h"
#include "lua/functions/creatures/player/guild_functions.hpp"

int GuildFunctions::luaGuildCreate(lua_State* L) {
	// Guild(id)
	uint32_t id = getNumber<uint32_t>(L, 2);

	Guild* guild = g_game().getGuild(id);
	if (guild) {
		pushUserdata<Guild>(L, guild);
		setMetatable(L, -1, "Guild");
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetId(lua_State* L) {
	// guild:getId()
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		lua_pushnumber(L, guild->getId());
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetName(lua_State* L) {
	// guild:getName()
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		pushString(L, guild->getName());
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetMembersOnline(lua_State* L) {
	// guild:getMembersOnline()
	const Guild* guild = getUserdata<const Guild>(L, 1);
	if (!guild) {
		lua_pushnil(L);
		return 1;
	}

	const auto &members = guild->getMembersOnline();
	lua_createtable(L, members.size(), 0);

	int index = 0;
	for (Player* player : members) {
		pushUserdata<Player>(L, player);
		setMetatable(L, -1, "Player");
		lua_rawseti(L, -2, ++index);
	}
	return 1;
}

int GuildFunctions::luaGuildGetBankBalance(lua_State* L) {
	// guild:getBankBalance()
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		lua_pushnumber(L, guild->getBankBalance());
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetLevel(lua_State* L) {
	// guild:getLevel()
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		lua_pushnumber(L, guild->getLevel());
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetPoints(lua_State* L) {
	// guild:getPoints()
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		lua_pushnumber(L, guild->getPoints());
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildSetLevel(lua_State* L) {
	// guild:setLevel(newlevel)
	Guild* guild = getUserdata<Guild>(L, 1);
	uint32_t newlevel = getNumber<uint32_t>(L, 2);
	if (guild) {
		guild->setLevel(newlevel);
		pushBoolean(L, true);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildSetPoints(lua_State* L) {
	// guild:setPoints(newpoints)
	Guild* guild = getUserdata<Guild>(L, 1);
	uint32_t newpoints = getNumber<uint32_t>(L, 2);
	if (guild) {
		guild->setPoints(newpoints);
		pushBoolean(L, true);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildSetBankBalance(lua_State* L) {
	// guild:setBankBalance(bankBalance)
	Guild* guild = getUserdata<Guild>(L, 1);
	if (!guild) {
		lua_pushnil(L);
		return 1;
	}

	guild->setBankBalance(getNumber<uint64_t>(L, 2));
	pushBoolean(L, true);
	return 1;
}

int GuildFunctions::luaGuildAddRank(lua_State* L) {
	// guild:addRank(id, name, level)
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		uint32_t id = getNumber<uint32_t>(L, 2);
		const std::string &name = getString(L, 3);
		uint8_t level = getNumber<uint8_t>(L, 4);
		guild->addRank(id, name, level);
		pushBoolean(L, true);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetRankById(lua_State* L) {
	// guild:getRankById(id)
	Guild* guild = getUserdata<Guild>(L, 1);
	if (!guild) {
		lua_pushnil(L);
		return 1;
	}

	uint32_t id = getNumber<uint32_t>(L, 2);
	GuildRank_ptr rank = guild->getRankById(id);
	if (rank) {
		lua_createtable(L, 0, 3);
		setField(L, "id", rank->id);
		setField(L, "name", rank->name);
		setField(L, "level", rank->level);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetRankByLevel(lua_State* L) {
	// guild:getRankByLevel(level)
	const Guild* guild = getUserdata<const Guild>(L, 1);
	if (!guild) {
		lua_pushnil(L);
		return 1;
	}

	uint8_t level = getNumber<uint8_t>(L, 2);
	GuildRank_ptr rank = guild->getRankByLevel(level);
	if (rank) {
		lua_createtable(L, 0, 3);
		setField(L, "id", rank->id);
		setField(L, "name", rank->name);
		setField(L, "level", rank->level);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildGetMotd(lua_State* L) {
	// guild:getMotd()
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		pushString(L, guild->getMotd());
	} else {
		lua_pushnil(L);
	}
	return 1;
}

int GuildFunctions::luaGuildSetMotd(lua_State* L) {
	// guild:setMotd(motd)
	const std::string &motd = getString(L, 2);
	Guild* guild = getUserdata<Guild>(L, 1);
	if (guild) {
		guild->setMotd(motd);
		pushBoolean(L, true);
	} else {
		lua_pushnil(L);
	}
	return 1;
}
